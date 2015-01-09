## Given a pair of SNPs, fit a model using single and collapsed genotypes
rep_models = function(mat, snp1, snp2, pheno_name, covar_names) {
    mat$colgen = ((mat[[snp1]] + mat[[snp2]]) >= 2) + 0
    covar_names = c(covar_names, "+")
    names(covar_names)[length(covar_names)] = "sep"
    covars = do.call(paste, as.list(covar_names))
    mod1 = summary(glm(as.formula(sprintf("%s ~ %s + %s", pheno_name, covars, snp1)), data=mat))
    mod2 = summary(glm(as.formula(sprintf("%s ~ %s + %s", pheno_name, covars, snp2)), data=mat))
    mod3 = summary(glm(as.formula(sprintf("%s ~ %s + colgen", pheno_name, covars)), data=mat))
    n = length(covars) + 2
    p1 = mod1$coefficients[n, 4]
    p2 = mod2$coefficients[n, 4]
    p3 = mod3$coefficients[n, 4]
    res = data.frame(snp1=snp1, snp2=snp2, p1=p1, p2=p2, pcol=p3)
    mis = missing_dat(mat[, c(snp1, snp2)])
    names(mis) = c("mis1", "mis2")
    maf_dat = maf(mat[, c(snp1, snp2)])
    names(maf_dat) = c("maf1", "maf2")
    res = cbind(res, mis, maf_dat)
    res
}


## Batch version of the `rep_models` function:
rep_dat = function(mat, snpdat, pheno_name, covar_names) {
    res = data.frame()
    for (i in 1:nrow(snpdat)) {
        snp1 = gsub(":", "AAA", snpdat$snp[i])
        snp1 = gsub("^(\\d+)", "C\\1", snp1)
        snp2 = gsub(":", "AAA", snpdat$snp2[i])
        snp2 = gsub("^(\\d+)", "C\\1", snp2)
        names(geno_mat) = gsub("^(\\d+)", "C\\1", names(geno_mat))
        print(c(snp1, snp2))
        row_res = rep_models(mat, snp1, snp2, pheno_name, covar_names)
        res = rbind(res, row_res)
    }
    res
}
