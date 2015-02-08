# permutation analysis
permute = function(plinkArgs, initGwasArgs, phenoFileOrig, phenoFileShuffle = "~/Desktop/shuffle_pheno.csv", pFilter=0.05, wDir=".", n=100, nShiftMax=10) {
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
        taskBedsPlinkOut(hubcollr, taskName, hubcollr[[taskName]]$fullGwasOut, pFilter, 1, nShiftMax)
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
