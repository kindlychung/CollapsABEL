taskinfo = function(hub, taskName, plinkParamList, initPlinkArgs, initGwas=FALSE) {
    hub[[taskName]] = new.env()
    hubtask = hub[[taskName]]

    hubtask$plinkParamList = plinkParamList
    hubtask$initPlinkArgs = initPlinkArgs
    hubtask$taskPath = file.path(hub$wDir, sprintf("collr_task_%s", taskName))
    hubtask$taskPlotPath = file.path(hubtask$taskPath, "collr_plots")
    if(! file.exists(hubtask$taskPath))     dir.create(hubtask$taskPath)
    if(! file.exists(hubtask$taskPlotPath)) dir.create(hubtask$taskPlotPath)
    hubtask$bedStem = file.path(hubtask$taskPath, basename(hub$bedStem))
    ## hubtask$taskBedPath = sprintf("%s.bed", hubtask$taskBedStem)
    ## hubtask$taskFamPath = sprintf("%s.fam", hubtask$taskBedStem)
    ## hubtask$taskBimPath = sprintf("%s.bim", hubtask$taskBedStem)

    hubtask$plinkParamNames = names(hubtask$plinkParamList)
    if("linear" %in% hubtask$plinkParamNames)   hubtask$plinkOutExt = "assoc.linear"
    if("logistic" %in% hubtask$plinkParamNames) hubtask$plinkOutExt = "assoc.logistic"

    if(initGwas) {
        tmplist = c(hubtask$plinkParamList, hubtask$initPlinkArgs)
        tmplist$bfile = hub$bedStem
        tmplist$out   = hubtask$bedStem
        do.call(plinkr, tmplist)
    }

    invisible(NULL)
}
