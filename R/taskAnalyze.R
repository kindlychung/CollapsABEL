taskAnalyze = function(hub, taskName) {
    hubtask = hub[[taskName]]
    tmplist = hubtask$plinkParamList
    tmplist$plinkcollFileStems = hubtask$taskShiftFilesStem
    do.call(plinkcollr, tmplist)
    cleanLog(hubtask$taskPath)
}
