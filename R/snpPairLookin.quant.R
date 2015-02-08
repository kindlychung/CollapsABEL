#' Look into a pairs of SNPs
#' 
#' Once your got a pair of SNPs that looks interesting from your GWAS, you can use this
#' function to look into their relations with the (quantitative) phenotype.
#' 
#' @param g1 Numeric. A vector of genotypes for SNP 1
#' @param g2 Numeric. A vector of genotypes for SNP 2
#' @param pheno Numeric. A vector of phenotypes.
#' @return A ggplot object.
snpPairLookin.quant = function(g1, g2, pheno) {
    g = paste(g1, g2, sep = "")
    g = factor(g, levels = c("00", "10", "01", "20", "11", "02", "21", "12", "22"))
    dat = data.frame(geno=g, pheno=pheno)
    dat = mice::cc(dat)
    ggplot(dat, aes(x = pheno)) + geom_histogram() + facet_grid(. ~ geno)
}

