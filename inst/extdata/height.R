
require(collr)
setwd("/media/data1/kaiyin/RS123_1KG")
plinkParamList = getPlinkParam(
    allow_no_sex = "",
    missing_phenotype = 9999,
    pheno = "RS123.1kg.pheno/height.csv",
    covar = "RS123.1kg.pheno/height.csv",
    covar_name = "SEX,AGE",
    linear = "hide-covar",
    pheno_name = "HEIGHT"
)
initPlinkArgs = getPlinkParam(maf = 0.01, hwe = 1e-4, geno=0.02)
taskRoutine( taskname="Height_s200", plinkParamList=plinkParamList, initPlinkArgs = initPlinkArgs, nMaxShift=200, pvalThresh=1e-3 ) 