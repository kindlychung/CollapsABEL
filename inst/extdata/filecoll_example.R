# 
# require(txtutils)
# install.packages("RCurl")
# require(RCurl)
# 
# url = "https://bitbucket.org/kindlychung/txtutils/downloads/test.assoc.linear"
# assocFile = "/tmp/test.assoc.linear"
# system2("wget", c("-O", assocFile, url))
# countlines(assocFile)
# fileExists(assocFile)
# ncols(assocFile)
# readcol(assocFile, 3, 1, 5)
# x = readplinkoutr(filename = assocFile, colnameSelect = c("SNP", "TEST", "P"))

require(devtools)
#load_all("/Users/kaiyin/personal_config_bin_files/workspace/manqq", reset=TRUE)
setwd("/Volumes/wdDataTransfer/data/sskn_regions_from_fan/AgeSexSskn")
# o = Filecoll("sskn_reg")
o = Readcoll(plinkOutExt = "assoc.linear", bedStem = "sskn_reg")
o$snpTopHits(5)





plinkr(allow_no_sex = "", bfile = "sskn_reg", pheno = "sskn_reg.phe", pheno_name = "sskn", 
       covar = "sskn_reg.phe", covar_name = "sex,age",
       linear = "hide-covar", out = "sskn_reg")

setwd("/Volumes/wdDataTransfer/data/testTaskcoll")
o1 = Taskcoll(taskname="test2")
o1$hardInitByPlinkOut(plinkOutFile = "sskn_reg.assoc.linear", nMaxShift = 2)
o1$analyze(allow_no_sex = "", pheno = "sskn_reg.phe", pheno_name = "sskn",  covar = "sskn_reg.phe", covar_name = "sex,age", linear = "hide-covar") 
o2 = Plotcoll(bedStem = "collr_task_test7/sskn_reg", plinkOutExt = "assoc.linear")
o2$batchPlots("collr_task_test7/plots")

require(devtools)
Sys.setenv("PKG_CXXFLAGS"="-std=c++11")
install_bitbucket("collr", username="kindlychung")

setwd("/Volumes/wdDataTransfer/data/mmp13/")
require(collr)
o = Filecoll("mmp13")
o1 = Taskcoll(taskname="test3")
o1$softInit()
o1$analyze(allow_no_sex = "", covar = "mmp13.phe", covar_name = "Sex,Cage,UnileverBatch,Wrinkles,Batch,Res", pheno = "mmp13.phe", pheno_name = "Page", linear = "hide-covar")
o2 = Plotcoll(bedStem = "collr_task_test3/mmp13", plinkOutExt = "assoc.linear")
o2$batchPlots("collr_task_test3/plots")



setwd("/Volumes/wdDataTransfer/data/mmp13/")
require(collr)

o1 = Taskcoll(taskname="test10")
o1$hardInitByPlinkOut(plinkOutFile="mmp13.assoc.linear", nMaxShift=5)
o1$analyze(
    allow_no_sex = "", 
    covar = "mmp13.phe", 
    covar_name = "Sex,Cage,UnileverBatch,Wrinkles,Batch,Res", 
    pheno = "mmp13.phe", pheno_name = "Page", 
    linear = "hide-covar"
    )

setwd("~/Desktop/mmp/")
require(collr)
# o = Taskcoll(wDir = "newmmp1", genBed=TRUE, taskname = "task4")
o = Taskcoll(
    wDir = "newmmp1", genBed=FALSE, 
    taskname = "task2", 
    plinkParamList = getPlinkParam(
        allow_no_sex = "", 
        covar = "mmp13.phe", 
        covar_name = "Sex,Cage,UnileverBatch,Wrinkles,Batch,Res", 
        pheno = "mmp13.phe", pheno_name = "Page", linear = "hide-covar"
        ))
o$bedStem
o$allMainFiles
o$allMainShiftFiles
o$wDir
o$bedPath
o$famPath
o$bimPath
o$shiftStemCommon
o$shiftFilesStem
o$shiftFilesBed
o$shiftFilesBim
o$shiftFilesFam
o$nShift
o$nShiftStrs
o$nTotalShifts
o$taskPath
o$taskPlotPath
o$taskBedStem
o$taskBedPath
o$taskBimPath
o$taskFamPath
o$taskShiftFilesBed
o$taskShiftFilesBim
o$taskShiftFilesFam
o$softInit()
o$plinkParamList
o$analyze()
o$hardInitByPlinkOutP(plinkOutFile="mmp13.assoc.linear", nMaxShift=5)

# setwd("/Users/kaiyin/Desktop/mmp/")
# bedcollr(bfile = "testcollr/mmp13", nshift_min = 1, nshift_max = 5)
# o = Plotcoll(wDir = "/Users/kaiyin/Desktop/mmp/newmmp1/collr_task_task1/", genBed = FALSE, plinkOutExt = "assoc.linear")
# x = o$contrastPlot()
# print(x)

setwd("/Volumes/wdDataTransfer/data/sskn_regions_from_fan/testcollr")
list.files()
argscoll = getPlinkParam(allow_no_sex = "", pheno = "sskn_reg.phe", pheno_name = "sskn",  covar = "sskn_reg.phe", covar_name = "sex,age", linear = "hide-covar")
taskRoutine(taskname = "test4", plinkParamList = argscoll, initGwas = TRUE, nMaxShift = 3, pvalThresh = 5e-2)


setwd("/Volumes/wdDataTransfer/data/sskn_regions_from_fan/testcollr")
list.files()
argscoll = getPlinkParam(allow_no_sex = "", pheno = "sskn_reg.phe", pheno_name = "red",  covar = "sskn_reg.phe", covar_name = "sex,age", logistic = "hide-covar", missing_phenotype = 9999)
taskRoutine(taskname = "test5", plinkParamList = argscoll, initGwas = TRUE, nMaxShift = 3, pvalThresh = 5e-2)

# tasko = Taskcoll(wDir = ".", genBed = FALSE, taskname = "test1", plinkParamList = argscoll)
# tasko$hardInitByPlinkOutP(plinkOutFile = "sskn_reg.assoc.linear", nMaxShift = 5)
# tasko$analyze()

