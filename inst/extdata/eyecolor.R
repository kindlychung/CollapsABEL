
# not working, error: --linear requires scalar phenotype
require(collr)
setwd("/media/data1/kaiyin/RS123_1KG")
argscoll = getPlinkParam(
  allow_no_sex = "",
  missing_phenotype = 9999,
  pheno = "RS123.1kg.pheno/eyecolordata.csv",
  covar = "RS123.1kg.pheno/eyecolordata.csv",
  covar_name = "sex,age",
  linear = "hide-covar",
  pheno_name = "ec"
)
taskRoutine(
  taskname="eyecolor_ec_s200",
  plinkParamList=argscoll,
  nMaxShift=200,
  initGwas = TRUE,
  pvalThresh=1e-3
)







require(collr)
setwd("/media/data1/kaiyin/RS123_1KG")
argscoll = getPlinkParam(
  allow_no_sex = "",
  missing_phenotype = 9999,
  pheno = "RS123.1kg.pheno/eyecolordata.csv",
  covar = "RS123.1kg.pheno/eyecolordata.csv",
  covar_name = "sex,age",
  linear = "hide-covar",
  pheno_name = "fan"
)
taskRoutine(
  taskname="eyecolor_fan_s200",
  plinkParamList=argscoll,
  nMaxShift=200,
  initGwas = TRUE,
  pvalThresh=1e-3
)


require(collr)
setwd("/media/data1/kaiyin/RS123_1KG")
argscoll = getPlinkParam(
  allow_no_sex = "",
  missing_phenotype = 9999,
  pheno = "RS123.1kg.pheno/eyecolordata.csv",
  covar = "RS123.1kg.pheno/eyecolordata.csv",
  covar_name = "sex,age",
  linear = "hide-covar",
  pheno_name = "epc2"
)
taskRoutine(
  taskname="eyecolor_epc2_s200",
  plinkParamList=argscoll,
  nMaxShift=200,
  initGwas = TRUE,
  pvalThresh=1e-3
)

require(collr)
setwd("/media/data1/kaiyin/RS123_1KG")
argscoll = getPlinkParam(
  allow_no_sex = "",
  missing_phenotype = 9999,
  pheno = "RS123.1kg.pheno/eyecolordata.csv",
  covar = "RS123.1kg.pheno/eyecolordata.csv",
  covar_name = "sex,age",
  linear = "hide-covar",
  pheno_name = "epc1"
)
taskRoutine(
  taskname="eyecolor_epc1_s200",
  plinkParamList=argscoll,
  nMaxShift=200,
  initGwas = TRUE,
  pvalThresh=1e-3
)


require(collr)
setwd("/media/data1/kaiyin/RS123_1KG")
argscoll = getPlinkParam(
  allow_no_sex = "",
  missing_phenotype = 9999,
  pheno = "RS123.1kg.pheno/eyecolordata.csv",
  covar = "RS123.1kg.pheno/eyecolordata.csv",
  covar_name = "sex,age",
  linear = "hide-covar",
  pheno_name = "s"
)
taskRoutine(
  taskname="eyecolor_s_s200",
  plinkParamList=argscoll,
  nMaxShift=200,
  initGwas = TRUE,
  pvalThresh=1e-3
)

require(collr)
setwd("/media/data1/kaiyin/RS123_1KG")
argscoll = getPlinkParam(
  allow_no_sex = "",
  missing_phenotype = 9999,
  pheno = "RS123.1kg.pheno/eyecolordata.csv",
  covar = "RS123.1kg.pheno/eyecolordata.csv",
  covar_name = "sex,age",
  linear = "hide-covar",
  pheno_name = "h"
)
taskRoutine(
  taskname="eyecolor_h_s200",
  plinkParamList=argscoll,
  nMaxShift=200,
  initGwas = TRUE,
  pvalThresh=1e-3
)
