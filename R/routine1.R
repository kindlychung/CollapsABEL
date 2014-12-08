routine1 = function(wDir=".", taskName, plinkArgs, initGwasArgs, initGwas=FALSE, pFilter=.05, nMaxShift) {
    setwd(wDir)
    hubcollr = collrinfo()
    bedcollinfo(hubcollr, genbed = FALSE)
    taskinfo(hubcollr, taskName, plinkArgs, initGwasArgs, initGwas)
    hubtask = hubcollr[[taskName]]
    checkFileExists(hubtask$fullGwasOut)
    
    taskBedsPlinkOut(hubcollr, taskName, hubtask$fullGwasOut, pFilter, 1, nMaxShift)
    taskAnalyze(hubcollr, taskName)
    readcoll.task(hubcollr, taskName)
    contrastPlot(hubtask)
    hubtask$taskContrastPlotFile = file.path(hubtask$taskPlotPath, "contrastPlot.png")
    ggsave(plot = hubtask$contrastPlotOut, filename = hubtask$taskContrastPlotFile, width=10, height=5)

    hubtask$workspaceImageFile = file.path(hubtask$taskPath, "taskWorkspace.RData")
    save(hubcollr, file=hubtask$workspaceImageFile)
    hubtask$contrastPlotOut
}
