taskinfo = function(hub, taskName, plinkParamList, initPlinkArgs, initGwas=FALSE, traitType=c("bin", "con")) {
    traitType = match.arg(traitType)
    hub[[taskName]] = new.env()
    hubtask = hub[[taskName]]

    hubtask$plinkParamList = plinkParamList
    hubtask$initPlinkArgs = initPlinkArgs

    hubtask$taskPath = file.path(hub$wDir, sprintf("collr_task_%s", taskName))
    hubtask$taskPlotPath = file.path(hubtask$taskPath, "collr_plots")
    if(file.exists(hubtask$taskPath)) unlink(hubtask$taskPath, recursive=TRUE, force=TRUE)
    if(file.exists(hubtask$taskPlotPath)) unlink(hubtask$taskPlotPath, recursive=TRUE, force=TRUE)
    dir.create(hubtask$taskPath)
    dir.create(hubtask$taskPlotPath)

    hubtask$bedStem = file.path(hubtask$taskPath, basename(hub$bedStem))
    ## hubtask$taskBedPath = sprintf("%s.bed", hubtask$taskBedStem)
    ## hubtask$taskFamPath = sprintf("%s.fam", hubtask$taskBedStem)
    ## hubtask$taskBimPath = sprintf("%s.bim", hubtask$taskBedStem)

    hubtask$plinkParamNames = names(hubtask$plinkParamList)
    hubtask$initPlinkArgNames = names(hubtask$initPlinkArgs)
    if("linear" %in% hubtask$plinkParamNames)     hubtask$plinkOutExt    = "assoc.linear"
    if("logistic" %in% hubtask$plinkParamNames)   hubtask$plinkOutExt    = "assoc.logistic"
    if("linear" %in% hubtask$initPlinkArgNames)   hubtask$fullGwasOutExt = "assoc.linear"
    if("logistic" %in% hubtask$initPlinkArgNames) hubtask$fullGwasOutExt = "assoc.logistic"
    if("assoc" %in% hubtask$initPlinkArgNames) {
        if(traitType == "bin") hubtask$fullGwasOutExt = "assoc"
        else                   hubtask$fullGwasOutExt = "qassoc"
    }
    hubtask$fullGwasOutStem = file.path(hub$fullGwasDir, sprintf("%s_%s", basename(hub$bedStem), taskName))
    hubtask$fullGwasOut = sprintf("%s.%s", hubtask$fullGwasOutStem, hubtask$fullGwasOutExt)

    if(initGwas) {
        tmplist = hubtask$initPlinkArgs
        tmplist$bfile = hub$bedStem
        tmplist$out   = hubtask$fullGwasOutStem
        do.call(plinkr, tmplist)
    }

    invisible(NULL)
}
