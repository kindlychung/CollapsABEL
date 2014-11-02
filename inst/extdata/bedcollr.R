require(collr)
setwd("~/Desktop/mmp/")

plinkParamList = getPlinkParam(allow_no_sex = "", pheno = "mmp13.phe", pheno_name = "Page", covar = "mmp13.phe", covar_name = "Sex,Cage", linear = "hide-covar")
initPlinkArgs = getPlinkParam(maf = 0.01, hwe = 1e-4)
taskRoutine(taskname = "mytask1", plinkParamList = plinkParamList, nMaxShift = 3, pvalThresh = .1, initPlinkArgs = initPlinkArgs, email="kindlychung@gmail.com")
#
# 
# 
# 
# 
# 
# 
# 
# 
# 
# 
# 
# 
# 
# 
# 
# 
# 
# 








# require(txtutils)
# require(collr)
# tmpdir = cpFromPackage(package = "collr")
# setwd(tmpdir)
# setwd("mmp")
# list.files()









setwd("/media/data1/kaiyin/RS123_1KG/collr_task_ec3/")
list.files()
require(rbed)
phe = read.table("../RS123.1kg.pheno/page_sskn_ec_hc_sc1.csv", head = TRUE, na.strings = "9999")
head(phe)

require(txtutils)
fam = readFam("RS123.1kg.fam")
head(fam)
table(fam$IID == phe$IID)

rbo = Rbed("RS123.1kg")
geno = rbo$bedmat.snpNameFile("snplist")
head(geno)
geno = as.data.frame(geno)
dim(geno)
dim(phe)
dat = cbind(geno, phe)
head(dat)

summary(glm(ec3~rs1129038+sex+age, data = dat))$coef

setwd("/Volumes//wdDataTransfer/data/collr_task_ec3/")
list.files()
require(collr)
o = Plotcoll(wDir=".", genBed=FALSE, plinkOutExt = "assoc.linear")
dim(o$pvals)
table(o$minPvals == 0)
o$batchPlots()


setwd("/Volumes//wdDataTransfer/data/collr_task_sskn")
list.files()
require(collr)
o = Plotcoll(wDir=".", genBed=FALSE, plinkOutExt = "assoc.linear")
dim(o$pvals)
table(o$minPvals == 0)
o$batchPlots()

setwd("/Volumes//wdDataTransfer/data/collr_task_sskn_s200/")
list.files()
require(collr)
o = Plotcoll(wDir=".", genBed=FALSE, plinkOutExt = "assoc.linear")
dim(o$pvals)
table(o$minPvals == 0)
o$batchPlots()


require(collr)
setwd("/Volumes//wdDataTransfer/data/sskn_regions_from_fan/")
list.files()
plinkParamList = getPlinkParam( allow_no_sex = "",  pheno = "sskn_reg.phe",  covar = "sskn_reg.phe",  covar_name = "sex,age",  linear = "hide-covar",  pheno_name = "sskn" )
initPlinkArgs = getPlinkParam(maf = 0.01, hwe = 1e-4)
taskRoutine( taskname = "sskn_s5",  plinkParamList = plinkParamList,  initPlinkArgs = initPlinkArgs, nMaxShift = 5,  pvalThresh = 1e-2)

