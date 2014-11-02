crt1 = function(wDir=".", taskName, plinkArgs, initGwasArgs, initGwas=FALSE, traitType=c("bin", "con"), pFilter=.05, nMaxShift) {
    traitType = match.arg(traitType)
    setwd(wDir)
    hubcollr = collrinfo()
    bedcollinfo(hubcollr, genbed = FALSE)
    taskinfo(hubcollr, taskName, plinkArgs, initGwasArgs, initGwas, traitType)
    hubtask = hubcollr[[taskName]]
    taskBedsPlinkOut(hubcollr, taskName, hubtask$fullGwasOut, pFilter, 1, nMaxShift)
    taskAnalyze(hubcollr, taskName)
    readcoll.task(hubcollr, taskName)
    hubtask$contrastPlotRes = contrastPlot(hubcollr[[taskName]])
    hubtask$contrastPlotRes
}
