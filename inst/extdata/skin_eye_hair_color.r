require(devtools)
install_bitbucket("kindlychung/collr2")

#############################
## redHair
#############################
require(collr2)
setwd("/media/data1/kaiyin/RS123_1KG/")
plinkArgs = getPlinkParam(
    allow_no_sex = "",
    missing_phenotype = 9999,
    logistic = "hide-covar",
    one = ""
)                                                                                  
initGwasArgs = getPlinkParam(
    allow_no_sex = "",
    missing_phenotype = 9999,
    one = "",
    assoc=""
)
routine2(
    pheno = "RS123.1kg.pheno/page_sskn_ec_hc_sc1.csv",
    pheno_name = "redHair",
    covar_name = "sex,age",
    plinkArgs = plinkArgs,
    initGwasArgs = initGwasArgs,
    pFilter = 1e-2,
    nMaxShift = 200
)




#############################
## hcNoRed
#############################
require(collr2)
setwd("/media/data1/kaiyin/RS123_1KG/")
plinkArgs = getPlinkParam(
    allow_no_sex = "",
    missing_phenotype = 9999,
    linear = "hide-covar"
)                                                                                  
initGwasArgs = getPlinkParam(
    allow_no_sex = "",
    missing_phenotype = 9999,
    assoc=""
)
routine2(
    pheno = "RS123.1kg.pheno/page_sskn_ec_hc_sc1.csv",
    pheno_name = "hcNoRed",
    covar_name = "sex,age",
    plinkArgs = plinkArgs,
    initGwasArgs = initGwasArgs,
    pFilter = 1e-2,
    nMaxShift = 200
)


#############################
## sskn
#############################
require(collr2)
setwd("/media/data1/kaiyin/RS123_1KG/")
plinkArgs = getPlinkParam(
    allow_no_sex = "",
    missing_phenotype = 9999,
    linear = "hide-covar"
)                                                                                  
initGwasArgs = getPlinkParam(
    allow_no_sex = "",
    missing_phenotype = 9999,
    assoc=""
)
routine2(
    pheno = "RS123.1kg.pheno/page_sskn_ec_hc_sc1.csv",
    pheno_name = "sskn",
    covar_name = "sex,age",
    plinkArgs = plinkArgs,
    initGwasArgs = initGwasArgs,
    pFilter = 1e-2,
    nMaxShift = 200
)


#############################
## sc3
#############################
require(collr2)
setwd("/media/data1/kaiyin/RS123_1KG/")
plinkArgs = getPlinkParam(
    allow_no_sex = "",
    missing_phenotype = 9999,
    linear = "hide-covar"
)                                                                                  
initGwasArgs = getPlinkParam(
    allow_no_sex = "",
    missing_phenotype = 9999,
    assoc=""
)
routine2(
    pheno = "RS123.1kg.pheno/page_sskn_ec_hc_sc1.csv",
    pheno_name = "sc3",
    covar_name = "sex,age",
    plinkArgs = plinkArgs,
    initGwasArgs = initGwasArgs,
    pFilter = 1e-2,
    nMaxShift = 200
)

#############################
## ec3
#############################
require(collr2)
setwd("/media/data1/kaiyin/RS123_1KG/")
plinkArgs = getPlinkParam(
    allow_no_sex = "",
    missing_phenotype = 9999,
    linear = "hide-covar"
)                                                                                  
initGwasArgs = getPlinkParam(
    allow_no_sex = "",
    missing_phenotype = 9999,
    assoc=""
)
routine2(
    pheno = "RS123.1kg.pheno/page_sskn_ec_hc_sc1.csv",
    pheno_name = "ec3",
    covar_name = "sex,age",
    plinkArgs = plinkArgs,
    initGwasArgs = initGwasArgs,
    pFilter = 1e-2,
    nMaxShift = 200
)

#############################
## page
#############################
require(collr2)
setwd("/media/data1/kaiyin/RS123_1KG/")
plinkArgs = getPlinkParam(
    allow_no_sex = "",
    missing_phenotype = 9999,
    linear = "hide-covar"
)                                                                                  
initGwasArgs = getPlinkParam(
    allow_no_sex = "",
    missing_phenotype = 9999,
    assoc=""
)
routine2(
    pheno = "RS123.1kg.pheno/page_sskn_ec_hc_sc1.csv",
    pheno_name = "page",
    covar_name = "sex,age",
    plinkArgs = plinkArgs,
    initGwasArgs = initGwasArgs,
    pFilter = 1e-2,
    nMaxShift = 200
)


