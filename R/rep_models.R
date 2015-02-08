#' Given a pair of SNPs, fit a model using single and collapsed genotypes
#' 
#' @param mat A data frame containing a collection of single SNP genotypes, SNP names should be column names.
#' @param snp1  Character.Name of first SNP
#' @param snp2  Character.Name of second SNP
#' @param pheno_name Character. Name of phenotype.
#' @param covar_names Character. Vector of names of covariates.
#' @return A data frame with five columns: snp1, snp2, p1 (p value of snp1), p2 (pvalue of snp2) and pcol (p value of collapsed genotype).
#' @export
rep_models = function(mat, snp1, snp2, pheno_name, covar_names) {
  mat$colgen = ((mat[, snp1] + mat[, snp2]) >= 2) + 0
  # build an args list for `paste`
  covar_names = c(covar_names, "+")
  names(covar_names)[length(covar_names)] = "sep"
  covars = do.call(paste, as.list(covar_names))
  mod1 = summary(glm(as.formula(sprintf("%s ~ %s + %s", pheno_name, covars, snp1)), data=mat))
  mod2 = summary(glm(as.formula(sprintf("%s ~ %s + %s", pheno_name, covars, snp2)), data=mat))
  mod3 = summary(glm(as.formula(sprintf("%s ~ %s + colgen", pheno_name, covars)), data=mat))

  if(snp1 %in% rownames(mod1$coef)) {
    p1 = mod1$coefficients[snp1, 4]
  } else {
    p1 = NA
  }

  if(snp2 %in% rownames(mod2$coef)) {
    p2 = mod2$coefficients[snp2, 4]
  } else {
    p2 = NA
  }

  if("colgen" %in% rownames(mod3$coef)) {
    p3 = mod3$coefficients["colgen", 4]
  } else {
    p3 = NA
  }

  res = data.frame(snp1=snp1, snp2=snp2, p1=p1, p2=p2, pcol=p3)
  mis = missing_dat(mat[, c(snp1, snp2)])
  names(mis) = c("mis1", "mis2")
  maf_dat = maf(mat[, c(snp1, snp2)])
  names(maf_dat) = c("maf1", "maf2")
  res = cbind(res, mis, maf_dat)
  res
}

#' Batch version of the \code{rep_models} function:
#' 
#' @param mat A data frame containing a collection of single SNP genotypes, SNP names should be column names.
#' @param snpdat A data frame containing pairs of SNP names. Each row should contain a one pair.
#' @param pheno_name Character. Name of phenotype.
#' @param covar_names Character. Vector of names of covariates.
#' @return A data frame with five columns: snp1, snp2, p1 (p value of snp1), p2 (pvalue of snp2) and pcol (p value of collapsed genotype).
#' @export
rep_dat = function(mat, snpdat, pheno_name, covar_names) {
  snpdat$snp = cleanSnpNames(snpdat$snp)
  snpdat$snp2 = cleanSnpNames(snpdat$snp2)
  names(mat) = cleanSnpNames(names(mat))
  res = data.frame()
  for (i in 1:nrow(snpdat)) {
    snp1 = snpdat$snp[i]
    snp2 = snpdat$snp2[i]
    # print(c(snp1, snp2))
    row_res = rep_models(mat, snp1, snp2, pheno_name, covar_names)
    res = rbind(res, row_res)
  }
  res
}


