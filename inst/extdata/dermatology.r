require(collr)
setwd("/media/data1/kaiyin/RS123_1KG")
plinkParamList = getPlinkParam(allow_no_sex = "", missing_phenotype = 9999, pheno = "RS123.1kg.pheno/dermatology.csv", covar = "RS123.1kg.pheno/dermatology.csv", covar_name = "sex,age,SC", linear = "hide-covar", pheno_name = "AK")
initPlinkArgs = getPlinkParam(maf = 0.01, hwe = 1e-4, geno=0.02)
taskRoutine( taskname="AK_s200", plinkParamList=plinkParamList, nMaxShift=200, pvalThresh=1e-3, initPlinkArgs = initPlinkArgs)

require(collr)
setwd("/media/data1/kaiyin/RS123_1KG")
plinkParamList = getPlinkParam( allow_no_sex = "", missing_phenotype = 9999, pheno = "RS123.1kg.pheno/dermatology.csv", covar = "RS123.1kg.pheno/dermatology.csv", covar_name = "sex,age,SC", linear = "hide-covar", pheno_name = "Sagging")
initPlinkArgs = getPlinkParam(maf = 0.01, hwe = 1e-4, geno=0.02)
taskRoutine( taskname="sagging_s200", plinkParamList=plinkParamList, nMaxShift=200, pvalThresh=1e-3, initPlinkArgs = initPlinkArgs)

require(collr)
setwd("/media/data1/kaiyin/RS123_1KG")
plinkParamList = getPlinkParam( allow_no_sex = "", missing_phenotype = 9999, pheno = "RS123.1kg.pheno/dermatology.csv", covar = "RS123.1kg.pheno/dermatology.csv", covar_name = "sex,age,SC", linear = "hide-covar", pheno_name = "Log_PS")
initPlinkArgs = getPlinkParam(maf = 0.01, hwe = 1e-4, geno=0.02)
taskRoutine( taskname="Log_PS_s200", plinkParamList=plinkParamList, nMaxShift=200, pvalThresh=1e-3, initPlinkArgs = initPlinkArgs)

require(collr)
setwd("/media/data1/kaiyin/RS123_1KG")
plinkParamList = getPlinkParam( allow_no_sex = "", missing_phenotype = 9999, pheno = "RS123.1kg.pheno/dermatology.csv", covar = "RS123.1kg.pheno/dermatology.csv", covar_name = "sex,age,SC,SunProtect", logistic = "hide-covar", one = "", pheno_name = "EasilyBurn")
initPlinkArgs = getPlinkParam(maf = 0.01, hwe = 1e-4, geno=0.02)
taskRoutine( taskname="EasilyBurn_s200", plinkParamList=plinkParamList, nMaxShift=200, pvalThresh=1e-3, initPlinkArgs = initPlinkArgs)

