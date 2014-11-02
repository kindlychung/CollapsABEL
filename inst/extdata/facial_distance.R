require(collr)
setwd("/media/data1/kaiyin/RS123_1KG")

phenoNames = paste("dist", 1:36, sep="")

for(phenoName in phenoNames) {
    argscoll = getPlinkParam(
        allow_no_sex = "",
        missing_phenotype = 9999,
        pheno = "RS123.1kg.pheno/face.phenoAll.csv",
        covar = "RS123.1kg.pheno/face.phenoAll.csv",
        covar_name = "sex,age",
        linear = "hide-covar",
        pheno_name = phenoName
    )
    taskRoutine(
        taskname = paste("face_", phenoName, "_s200", sep=""),
        plinkParamList=argscoll,
        nMaxShift=200,
        initGwas = TRUE,
        pvalThresh=1e-3
    )
}

