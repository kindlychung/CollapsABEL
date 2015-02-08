#' A pure R implementation of GWAS 
#' 
#' @param pheno_mat Phenotype data frame
#' @param geno_mat Genotype data frame
#' @param pheno_name Name of phenotype
#' @param covar_names Names of covariates
#' @return A data frame with two columns, one for SNP names, one for p values.
gwas = function(pheno_mat, geno_mat, pheno_name, covar_names) {
  # Join phenotype and genotype data
  # Each columns of geno_mat is an SNP
  # phe and geno_mat are expected to have same number of rows,
  # and each row corresponds to the same individual
  # The headers of geno_mat should be SNP names

  # Clean up SNP names
  snps = names(geno_mat)
  snps = cleanSnpNames(snps)
  names(geno_mat) = snps
  dat = cbind(pheno_mat, geno_mat)

  # build an args list for `paste`
  covar_names = c(covar_names, "+")
  names(covar_names)[length(covar_names)] = "sep"
  covars = do.call(paste, as.list(covar_names))

  getp = function(snp) {
    coefs = summary(glm(as.formula(
      sprintf("%s ~ %s + %s", pheno_name, covars, snp)),
      data=dat))$coef

    if(snp %in% rownames(coefs)) {
      p = coefs[snp, 4]
    } else {
      p = NA
    }
    p
  }
  res = sapply(snps, getp)
#   plot(-log10(res))
  res
}
