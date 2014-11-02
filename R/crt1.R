crt1 = function(wDir=".", taskName, plinkArgs, initGwasArgs, initGwas=FALSE, traitType=c("bin", "con"), pFilter=.05) {
    traitType = match.arg(traitType)
    setwd(wDir)
    hubcollr = collrinfo()
    bedcollinfo(hubcollr, genbed = FALSE)
    taskinfo(hubcollr, taskName, plinkArgs, initGwasArgs, initGwas, traitType)
    hubtask = hubcollr[[taskName]]
    hubtask$fullGwasOut = sprintf("%s.%s", hubtask$bedStem, hubtask$fullGwasOutExt) 
    taskBedsPlinkOut(hubcollr, taskName, hubtask$fullGwasOut, pFilter, 1, 10)
    taskAnalyze(hubcollr, taskName)
    readcoll.task(hubcollr, taskName)
    contrastPlot(hubcollr[[taskName]])
}
