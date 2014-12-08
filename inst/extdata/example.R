require(devtools)
install_bitbucket("kindlychung/txtutils")
# install_bitbucket("kindlychung/manqq2")
# install_github("kindlychung/gmailR")
# install_bitbucket("kindlychung/autoGmail")
install_bitbucket("kindlychung/collr2")


library(collr2)
setwd("~/Desktop/mmp3")
plinkArgs    = getPlinkParam(allow_no_sex = "", pheno = "mmp13.phe", pheno_name = "Page", covar = "mmp13.phe", covar_name = "Sex,Cage", linear = "hide-covar")
initGwasArgs = getPlinkParam(maf=.01, hwe=1e-4, allow_no_sex = "", pheno = "mmp13.phe", pheno_name = "Page", assoc= "")
crt1("~/Desktop/mmp3", "test4", plinkArgs, initGwasArgs, FALSE, 0.1, 5)

debug(permute)
pv = permute(plinkArgs = plinkArgs, initGwasArgs = initGwasArgs, phenoFileOrig = "mmp13.phe", pFilter = .2, nShiftMax = 10, n=10)
sort(pv)

require(collr2)
setwd("/media/data1/kaiyin/RS123_1KG/")
plinkArgs = getPlinkParam(allow_no_sex = "", missing_phenotype = 9999, pheno = "RS123.1kg.pheno/dermatology.csv", covar = "RS123.1kg.pheno/dermatology.csv", covar_name = "sex,age,SC,SunProtect", logistic = "hide-covar", one = "", pheno_name = "EasilyBurn")                                                                                  
initGwasArgs = getPlinkParam(allow_no_sex = "", missing_phenotype = 9999, pheno = "RS123.1kg.pheno/dermatology.csv", one = "", pheno_name = "EasilyBurn", assoc="")
debug(crt1)
crt1("/media/data1/kaiyin/RS123_1KG", "easilyburn2_s200a", plinkArgs, initGwasArgs, FALSE, 1e-5, 5)






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
perm




# erf4 huid07, winszie=200
setwd("/media/data1/kaiyin/erf4/")
require(collr2)
plinkArgs = getPlinkParam(allow_no_sex = "", pheno = "erf4.pheno/erf_all_phdata.txt", pheno_name = "huid07", covar = "erf4.pheno/erf_all_phdata.txt", covar_name = "sex,age", linear = "hide-covar")
initGwasArgs = getPlinkParam(maf=.01, hwe=1e-4, allow_no_sex = "", pheno = "erf4.pheno/erf_all_phdata.txt", pheno_name = "huid07", assoc= "")
crt1(".", "huid07b", plinkArgs, initGwasArgs, TRUE, "con", 0.001, 200)


shuffleLines = function(phenoFileOrig, phenoFile, shuffleVar) {
    tab = read.table(phenoFileOrig, head=TRUE)
    # print(head(tab, 10))
    tab[, shuffleVar] = sample(tab[, shuffleVar])
    # print(head(tab, 10))
    write.table(tab, phenoFile, quote = FALSE, row.names = FALSE)
}
permute = function(plinkArgs, initGwasArgs, phenoFileOrig, phenoFileShuffle = "~/Desktop/shuffle_pheno.csv", wDir=".", n=100) {
    setwd(wDir)
    globalMinVec = numeric(0)
    plinkArgs$pheno = phenoFileShuffle
    if(!is.null(plinkArgs$covar))  plinkArgs$covar = phenoFileShuffle
    initGwasArgs$pheno = phenoFileShuffle
    taskName = "permutation_analysis"
    for(i in 1:n) {
        shuffleLines(phenoFileOrig, phenoFileShuffle, plinkArgs$pheno_name)
        hubcollr = collrinfo()
        bedcollinfo(hubcollr, genbed=FALSE)
        taskinfo(hubcollr, taskName, plinkArgs, initGwasArgs, TRUE)
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
    globalMinVec
}


require(collr2)
setwd("/media/data1/kaiyin/erf4")
phenoFileOrig = "erf4.pheno/erf_all_phdata.txt"


require(collr2)
plinkArgs = getPlinkParam(allow_no_sex = "", pheno = "erf4.pheno/erf_all_phdata.txt", pheno_name = "huid07", covar = "erf4.pheno/erf_all_phdata.txt", covar_name = "sex,age", linear = "hide-covar")
initGwasArgs = getPlinkParam(maf=.01, hwe=1e-4, allow_no_sex = "", pheno = "erf4.pheno/erf_all_phdata.txt", pheno_name = "huid07", assoc= "")
