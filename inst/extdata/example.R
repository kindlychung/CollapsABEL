require(devtools)
install_bitbucket("kindlychung/txtutils")
# install_bitbucket("kindlychung/manqq2")
# install_github("kindlychung/gmailR")
# install_bitbucket("kindlychung/autoGmail")
install_bitbucket("kindlychung/collr2")

setwd("~/Desktop/mmp3")
hubcollr = collrinfo()
summary(hubcollr)
# bedcollinfo(hubcollr, genbed = TRUE, nShiftMin = 1, nShiftMax = 5)
bedcollinfo(hubcollr, genbed = FALSE, nShiftMin = 1, nShiftMax = 5)
plinkargs = getPlinkParam(allow_no_sex = "", pheno = "mmp13.phe", pheno_name = "Page", covar = "mmp13.phe", covar_name = "Sex,Cage", linear = "hide-covar")
qcfilter = getPlinkParam(maf=.01, hwe=1e-4)
taskinfo(hubcollr, "test1", plinkargs, qcfilter, TRUE)
taskBedsPlinkOut(hubcollr, "test1", "collr_task_test1/mmp13.assoc.linear", .1, 1, 10)
taskAnalyze(hubcollr, "test1")
readcoll.task(hubcollr, "test1")
basePlot(hubcollr$test1)
minPlot(hubcollr$test1)
contrastPlot(hubcollr$test1)

setwd("~/Desktop/mmp3")
hubcollr = collrinfo()
# bedcollinfo(hubcollr, genbed = TRUE, nShiftMin = 1, nShiftMax = 5)
bedcollinfo(hubcollr, genbed = FALSE)
plinkargs = getPlinkParam(allow_no_sex = "", pheno = "mmp13.phe", pheno_name = "Page", covar = "mmp13.phe", covar_name = "Sex,Cage", linear = "hide-covar")
qcfilter = getPlinkParam(maf=.01, hwe=1e-4, allow_no_sex = "", pheno = "mmp13.phe", pheno_name = "Page", assoc= "")
taskinfo(hubcollr, "test2", plinkargs, qcfilter, FALSE, "con")
taskBedsPlinkOut(hubcollr, "test2", "collr_full_gwas/mmp13_test4.qassoc", .1, 1, 10)
taskAnalyze(hubcollr, "test2")
readcoll.task(hubcollr, "test2")
contrastPlot(hubcollr$test2)
undebug(bedcollinfo)
undebug(taskinfo)
debug(bedcollinfo)
debug(taskinfo)
plinkArgs    = getPlinkParam(allow_no_sex = "", pheno = "mmp13.phe", pheno_name = "Page", covar = "mmp13.phe", covar_name = "Sex,Cage", linear = "hide-covar")
initGwasArgs = getPlinkParam(maf=.01, hwe=1e-4, allow_no_sex = "", pheno = "mmp13.phe", pheno_name = "Page", assoc= "")
crt1("~/Desktop/mmp3", "test4", plinkArgs, initGwasArgs, TRUE, "con", 0.1, 5)

require(collr2)
plinkArgs = getPlinkParam(allow_no_sex = "", missing_phenotype = 9999, pheno = "RS123.1kg.pheno/dermatology.csv", covar = "RS123.1kg.pheno/dermatology.csv", covar_name = "sex,age,SC,SunProtect", logistic = "hide-covar", one = "", pheno_name = "EasilyBurn")                                                                                  
initGwasArgs = getPlinkParam(allow_no_sex = "", missing_phenotype = 9999, pheno = "RS123.1kg.pheno/dermatology.csv", one = "", pheno_name = "EasilyBurn", assoc="", maf = 0.01, hwe = 1e-4, geno=0.02)
crt1("/media/data1/kaiyin/RS123_1KG", "easilyburn2_s10", plinkArgs, initGwasArgs, TRUE, "bin", 1e-3, 10)

setwd("/media/data1/kaiyin/RS123_1KG")
plinkArgs = getPlinkParam(allow_no_sex = "", missing_phenotype = 9999, pheno = "RS123.1kg.pheno/dermatology.csv", covar = "RS123.1kg.pheno/dermatology.csv", covar_name = "sex,age,SC", linear = "hide-covar", pheno_name = "AK")
initGwasArgs  = getPlinkParam(maf = 0.01, hwe = 1e-4, geno=0.02)
taskRoutine( taskname="AK_s200", plinkParamList=plinkParamList, nMaxShift=200, pvalThresh=1e-3, initPlinkArgs = initPlinkArgs)


debug(crt1)
debug(taskinfo)


hubcollr$test1$nsnp
hubcollr$test1$bp[1:10, 1:10]
hubcollr$test1$bp2[1:10, 1:10]
hubcollr$test1$snp[1:10, 1:10]
hubcollr$test1$snp2[1:10, 1:10]

options(warn = 2, keep.source = TRUE, error = 
            quote({ 
                cat("Environment:\n", file=stderr()); 
                dump.frames();  # writes to last.dump
                n <- length(last.dump)
                calls <- names(last.dump)
                cat(paste("  ", 1L:n, ": ", calls, sep = ""), sep = "\n", file=stderr())
                cat("\n", file=stderr())
                if (!interactive()) {
                    q()
                }
            }),
        warning.expression =             quote({ 
            cat("Environment:\n", file=stderr()); 
            dump.frames();  # writes to last.dump
            n <- length(last.dump)
            calls <- names(last.dump)
            cat(paste("  ", 1L:n, ": ", calls, sep = ""), sep = "\n", file=stderr())
            cat("\n", file=stderr())
            if (!interactive()) {
                q()
            }
        })
        )

install.packages(c("doParallel", "foreach"))

shuffleLines = function(phenoFileOrig, phenoFile, shuffleVar) {
    tab = read.table(phenoFileOrig, head=TRUE)
    print(head(tab, 3))
    tab[, shuffleVar] = sample(tab[, shuffleVar])
    print(head(tab, 3))
    write.table(tab, phenoFile, quote = FALSE, row.names = FALSE)
}

require(collr2)
setwd("/media/data1/kaiyin/RS123_1KG/")
globalMinVec = numeric(0)
phenoFileOrig = "RS123.1kg.pheno/dermatology.csv"
phenoFile = "~/Desktop/shuffle_pheno.csv"
for(i in 1:100) {
    i = 1
    taskName = sprintf("easilyburn2_permutation_%d", i)
    shuffleLines(phenoFileOrig, phenoFile, "EasilyBurn")
    plinkArgs = getPlinkParam(allow_no_sex = "", missing_phenotype = 9999, pheno = phenoFile, covar = phenoFile, covar_name = "sex,age,SC,SunProtect", logistic = "hide-covar", one = "", pheno_name = "EasilyBurn")
    initGwasArgs = getPlinkParam(allow_no_sex = "", missing_phenotype = 9999, pheno = phenoFile, one = "", pheno_name = "EasilyBurn", assoc="", maf = 0.01, hwe = 1e-4, geno=0.02)
    hubcollr = collrinfo()
    bedcollinfo(hubcollr, genbed=FALSE)
    taskinfo(hubcollr, taskName, plinkArgs, initGwasArgs, TRUE, "bin")
    taskBedsPlinkOut(hubcollr, taskName, hubcollr[[taskName]]$fullGwasOut, 1e-3, 1, 200)
    taskAnalyze(hubcollr, taskName)
    readcoll.task(hubcollr, taskName)
    globalMin = min(hubcollr[[taskName]]$minPvals)
    if(globalMin > 1)      globalMin = 1
    if(globalMin < 1e-300) globalMin = 1e-300
    globalMinVec = c(globalMinVec, globalMin)
    message("*****************************************************")
    print(globalMinVec)
    message("*****************************************************")
    unlink(hubcollr[[taskName]]$taskPath, recursive = TRUE, force = TRUE)
}

############################################################
args <- commandArgs(trailingOnly = TRUE)
print(args)

require(collr2)
setwd("~/Desktop/mmp3")
globalMinVec = numeric(0)
phenoFileOrig = "mmp13.phe"
phenoFile = "~/Desktop/shuffle_pheno.csv"
taskName = sprintf("easilyburn2_permutation_%d", i)
shuffleLines(phenoFileOrig, phenoFile, "Page")
plinkArgs    = getPlinkParam(allow_no_sex = "", pheno = phenoFile, pheno_name = "Page", covar = phenoFile, covar_name = "Sex,Cage", linear = "hide-covar")
initGwasArgs = getPlinkParam(maf=.01, hwe=1e-4, allow_no_sex = "", pheno = phenoFile, pheno_name = "Page", assoc= "")
rm(hubcollr)
hubcollr = collrinfo()
bedcollinfo(hubcollr, genbed=FALSE)
taskinfo(hubcollr, taskName, plinkArgs, initGwasArgs, TRUE, "con")
taskBedsPlinkOut(hubcollr, taskName, hubcollr[[taskName]]$fullGwasOut, .2, 1, 10)
taskAnalyze(hubcollr, taskName)
readcoll.task(hubcollr, taskName)
contrastPlot(hubcollr[[taskName]])
globalMin = min(hubcollr[[taskName]]$minPvals)
print(globalMin)
if(globalMin > 1)      globalMin = 1
if(globalMin < 1e-300) globalMin = 1e-300
globalMinVec = c(globalMinVec, globalMin)
unlink(hubcollr[[taskName]]$taskPath, recursive = TRUE, force = TRUE)