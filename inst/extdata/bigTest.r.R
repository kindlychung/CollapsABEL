# TODO: Add comment
#
# Author: kaiyin
###############################################################################



require(collr)
setwd("/media/data1/kaiyin/RS123_1KG")
list.files()
plinkParamList = getPlinkParam(
    allow_no_sex = "",
    one="",
    missing_phenotype = 9999,
    pheno = "RS123.1kg.pheno/page_sskn_ec_hc_sc1.csv",
    covar = "RS123.1kg.pheno/page_sskn_ec_hc_sc1.csv",
    covar_name = "sex,age",
    logistic = "hide-covar",
    pheno_name = "redHair"
)
initPlinkArgs = getPlinkParam(maf = 0.01, hwe = 1e-4, geno=0.02)
taskRoutine( taskname = "redHair_s10", plinkParamList = plinkParamList, initPlinkArgs = initPlinkArgs, nMaxShift = 10, pvalThresh = 1e-3)


require(collr)
setwd("/media/data1/kaiyin/RS123_1KG")
list.files()
plinkParamList = getPlinkParam( allow_no_sex = "",
                                missing_phenotype = 9999,
                                pheno = "RS123.1kg.pheno/page_sskn_ec_hc_sc1.csv",
                                covar = "RS123.1kg.pheno/page_sskn_ec_hc_sc1.csv",
                                covar_name = "sex,age",
                                linear = "hide-covar",
                                pheno_name = "hcNoRed")
initPlinkArgs = getPlinkParam(maf = 0.01, hwe = 1e-4, geno=0.02)
taskRoutine( taskname = "hcNoRedTask", plinkParamList = plinkParamList, initPlinkArgs = initPlinkArgs, nMaxShift = 10, pvalThresh = 1e-3)

require(collr)
setwd("/media/data1/kaiyin/RS123_1KG")
list.files()
plinkParamList = getPlinkParam(
    allow_no_sex = "",
    missing_phenotype = 9999,
    pheno = "RS123.1kg.pheno/page_sskn_ec_hc_sc1.csv",
    covar = "RS123.1kg.pheno/page_sskn_ec_hc_sc1.csv",
    covar_name = "sex,age",
    linear = "hide-covar",
    pheno_name = "sskn"
)
initPlinkArgs = getPlinkParam(maf = 0.01, hwe = 1e-4, geno=0.02)
taskRoutine( taskname = "sskn_s10", plinkParamList = plinkParamList, initPlinkArgs = initPlinkArgs, nMaxShift = 10, pvalThresh = 1e-3)

require(collr)
setwd("/media/data1/kaiyin/RS123_1KG")
list.files()
plinkParamList = getPlinkParam(
    allow_no_sex = "",
    missing_phenotype = 9999,
    pheno = "RS123.1kg.pheno/page_sskn_ec_hc_sc1.csv",
    covar = "RS123.1kg.pheno/page_sskn_ec_hc_sc1.csv",
    covar_name = "sex,age",
    linear = "hide-covar",
    pheno_name = "sc3"
)
initPlinkArgs = getPlinkParam(maf = 0.01, hwe = 1e-4, geno=0.02)
taskRoutine( taskname = "sc3_s10", plinkParamList = plinkParamList, initPlinkArgs = initPlinkArgs, nMaxShift = 10, pvalThresh = 1e-3)

require(collr)
setwd("/media/data1/kaiyin/RS123_1KG")
list.files()
plinkParamList = getPlinkParam(
    allow_no_sex = "",
    missing_phenotype = 9999,
    pheno = "RS123.1kg.pheno/page_sskn_ec_hc_sc1.csv",
    covar = "RS123.1kg.pheno/page_sskn_ec_hc_sc1.csv",
    covar_name = "sex,age",
    linear = "hide-covar",
    pheno_name = "ec3"
)
initPlinkArgs = getPlinkParam(maf = 0.01, hwe = 1e-4, geno=0.02)
taskRoutine( taskname = "ec3_s10", plinkParamList = plinkParamList, initPlinkArgs = initPlinkArgs, nMaxShift = 10, pvalThresh = 1e-3)

require(collr)
setwd("/media/data1/kaiyin/RS123_1KG")
list.files()
plinkParamList = getPlinkParam(
    allow_no_sex = "",
    missing_phenotype = 9999,
    pheno = "RS123.1kg.pheno/page_sskn_ec_hc_sc1.csv",
    covar = "RS123.1kg.pheno/page_sskn_ec_hc_sc1.csv",
    covar_name = "sex,age",
    linear = "hide-covar",
    pheno_name = "page"
)
initPlinkArgs = getPlinkParam(maf = 0.01, hwe = 1e-4, geno=0.02)
taskRoutine( taskname = "page_s10", plinkParamList = plinkParamList, initPlinkArgs = initPlinkArgs, nMaxShift = 10, pvalThresh = 1e-3)


####################################################
# 200 shift size
####################################################

require(collr)
setwd("/media/data1/kaiyin/RS123_1KG")
list.files()
plinkParamList = getPlinkParam(
    allow_no_sex = "",
    one="",
    missing_phenotype = 9999,
    pheno = "RS123.1kg.pheno/page_sskn_ec_hc_sc1.csv",
    covar = "RS123.1kg.pheno/page_sskn_ec_hc_sc1.csv",
    covar_name = "sex,age",
    logistic = "hide-covar",
    pheno_name = "redHair"
)
initPlinkArgs = getPlinkParam(maf = 0.01, hwe = 1e-4, geno=0.02)
taskRoutineGp( taskname = "redHair_s200", plinkParamList = plinkParamList, initPlinkArgs = initPlinkArgs, nMaxShift = 200, pvalThresh = 1e-3, plinkOutFileForPfilter = "collr_task_redHair_s10/RS123.1kg.assoc.logistic")


require(collr)
setwd("/media/data1/kaiyin/RS123_1KG")
list.files()
plinkParamList = getPlinkParam( allow_no_sex = "",
                                missing_phenotype = 9999,
                                pheno = "RS123.1kg.pheno/page_sskn_ec_hc_sc1.csv",
                                covar = "RS123.1kg.pheno/page_sskn_ec_hc_sc1.csv",
                                covar_name = "sex,age",
                                linear = "hide-covar",
                                pheno_name = "hcNoRed")
initPlinkArgs = getPlinkParam(maf = 0.01, hwe = 1e-4, geno=0.02)
taskRoutineGp( taskname = "hcNoRed_s200", plinkParamList = plinkParamList, initPlinkArgs = initPlinkArgs, nMaxShift = 200, pvalThresh = 1e-3, plinkOutFileForPfilter = "collr_task_hcNoRed_s10/RS123.1kg.assoc.linear")

require(collr)
setwd("/media/data1/kaiyin/RS123_1KG")
list.files()
plinkParamList = getPlinkParam(
    allow_no_sex = "",
    missing_phenotype = 9999,
    pheno = "RS123.1kg.pheno/page_sskn_ec_hc_sc1.csv",
    covar = "RS123.1kg.pheno/page_sskn_ec_hc_sc1.csv",
    covar_name = "sex,age",
    linear = "hide-covar",
    pheno_name = "sskn"
)
initPlinkArgs = getPlinkParam(maf = 0.01, hwe = 1e-4, geno=0.02)
taskRoutineGp( taskname = "sskn_s200", plinkParamList = plinkParamList, initPlinkArgs = initPlinkArgs, nMaxShift = 200, pvalThresh = 1e-3, plinkOutFileForPfilter = "collr_task_sskn_s10/RS123.1kg.assoc.linear")

require(collr)
setwd("/media/data1/kaiyin/RS123_1KG")
list.files()
plinkParamList = getPlinkParam(
    allow_no_sex = "",
    missing_phenotype = 9999,
    pheno = "RS123.1kg.pheno/page_sskn_ec_hc_sc1.csv",
    covar = "RS123.1kg.pheno/page_sskn_ec_hc_sc1.csv",
    covar_name = "sex,age",
    linear = "hide-covar",
    pheno_name = "sc3"
)
initPlinkArgs = getPlinkParam(maf = 0.01, hwe = 1e-4, geno=0.02)
taskRoutineGp( taskname = "sc3_s200", plinkParamList = plinkParamList, initPlinkArgs = initPlinkArgs, nMaxShift = 200, pvalThresh = 1e-3, plinkOutFileForPfilter = "collr_task_sc3_s10/RS123.1kg.assoc.linear")

require(collr)
setwd("/media/data1/kaiyin/RS123_1KG")
list.files()
plinkParamList = getPlinkParam(
    allow_no_sex = "",
    missing_phenotype = 9999,
    pheno = "RS123.1kg.pheno/page_sskn_ec_hc_sc1.csv",
    covar = "RS123.1kg.pheno/page_sskn_ec_hc_sc1.csv",
    covar_name = "sex,age",
    linear = "hide-covar",
    pheno_name = "ec3"
)
initPlinkArgs = getPlinkParam(maf = 0.01, hwe = 1e-4, geno=0.02)
taskRoutineGp( taskname = "ec3_s200", plinkParamList = plinkParamList, initPlinkArgs = initPlinkArgs, nMaxShift = 200, pvalThresh = 1e-3, plinkOutFileForPfilter = "collr_task_ec3_s10/RS123.1kg.assoc.linear")

require(collr)
setwd("/media/data1/kaiyin/RS123_1KG")
list.files()
plinkParamList = getPlinkParam(
    allow_no_sex = "",
    missing_phenotype = 9999,
    pheno = "RS123.1kg.pheno/page_sskn_ec_hc_sc1.csv",
    covar = "RS123.1kg.pheno/page_sskn_ec_hc_sc1.csv",
    covar_name = "sex,age",
    linear = "hide-covar",
    pheno_name = "page"
)
initPlinkArgs = getPlinkParam(maf = 0.01, hwe = 1e-4, geno=0.02)
taskRoutineGp( taskname = "page_s200", plinkParamList = plinkParamList, initPlinkArgs = initPlinkArgs, nMaxShift = 200, pvalThresh = 1e-3, plinkOutFileForPfilter = "collr_task_page_s10/RS123.1kg.assoc.linear")

