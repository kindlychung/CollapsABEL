
require(collr)
setwd("~/tron/media/data1/kaiyin/testssknGW/")
list.files()
argscoll = getPlinkParam(
    allow_no_sex = "", 
    one="", 
    missing_phenotype = 9999,
    pheno = "~/tron/media/data1/kaiyin/RS123_1KG/RS123.1kg.pheno/page_sskn_ec_hc_sc1.csv", 
    covar = "~/tron/media/data1/kaiyin/RS123_1KG/RS123.1kg.pheno/page_sskn_ec_hc_sc1.csv", 
    covar_name = "sex,age", 
    linear = "hide-covar", 
    pheno_name = "sskn"
)
taskRoutine(
    taskname = "sskn", 
    plinkParamList = argscoll, 
    initGwas = TRUE, 
    nMaxShift = 10, 
    pvalThresh = 1e-3
)
