## require(ggplot2)
## n_simu = 5000
## g1 = sample(0:2, n_simu, replace = TRUE)
## g2 = sample(0:2, n_simu, replace = TRUE)
## g = paste(g1, g2, sep = "")
## g = factor(g, levels = c("00", "10", "01", "20", "11", "02", "21", "12", "22"))
## pheno = rnorm(n_simu)
## dat = data.frame(geno=g, pheno=pheno)
## ggplot(dat, aes(x = pheno)) + geom_density() + facet_grid(geno ~ .)
## require(rbed2)
## remove.packages("rbed2")
## require(devtools)
## install_bitbucket("kindlychung/rbed2")

snpPairLookin.quant = function(g1, g2, pheno) {
    g = paste(g1, g2, sep = "")
    g = factor(g, levels = c("00", "10", "01", "20", "11", "02", "21", "12", "22"))
    dat = data.frame(geno=g, pheno=pheno)
    dat = mice::cc(dat)
    ggplot(dat, aes(x = pheno)) + geom_histogram() + facet_grid(. ~ geno)
}
