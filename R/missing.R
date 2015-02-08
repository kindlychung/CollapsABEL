# missing rate per SNP
missing_snp = function(snp) {
    sum(is.na(snp)) / length(snp)
}
missing_dat = function(geno_mat) {
    as.data.frame(lapply(geno_mat, missing_snp))
}

# Major allele frequency per SNP
maf_snp = function(snp) {
    snp = na.omit(snp)
    sum(snp) / (2 * length(snp))
}
maf = function(geno_mat) {
  as.data.frame(lapply(geno_mat, maf_snp))
}
