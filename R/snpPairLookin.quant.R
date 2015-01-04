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
    # normalized histogram, sum + .1, to avoid division-by-zero error
    ## ggplot(dat, aes(x = pheno)) + geom_histogram(aes(y=..count../(0.1 + sum(..count..)))) + facet_grid(. ~ geno)
    ggplot(dat, aes(x = pheno)) + geom_histogram() + facet_grid(. ~ geno) + scales::scale_y_continuous(labels = percent_format())
}

## load("/tmp/snpdat5.rda")
## load("/tmp/snpdat18.rda")
## setwd("/media/thecus/kaiyin/RS123_1KG_maf0.01/")
## snpdat5 = snpdat5[, !(names(snpdat5) %in% c("chr", "bp", "chr2", "bp2", "pbonfer"))]
## require(rbed2)
## rbinfo = rbedinfo("RS123")
## geno_mat = bedmat.snpNameVec(rbinfo, c("rs450917", "rs77193767"))
## pheno_mat = read.table("/media/data1/RS123_pheno/dermatology.csv", head=T)
## pheno_mat[pheno_mat == 9999] = NA
## pheno_mat = pheno_mat[, c("FID", "IID", "Sagging")]
## pheno_mat$IID = as.character(pheno_mat$IID)
## require(dplyr)
## dat = inner_join(pheno_mat, geno_mat, by="IID")
## require(collr2)
## p = snpPairLookin.quant(dat$rs77193767, dat$rs450917, dat$Sagging)
## require(ggplot2)
## ggsave(plot=p, "/tmp/snppair_lookin_rs77193767_rs450917.pdf", width=10, height=5)
## savehistory(file="/tmp/x.r")
