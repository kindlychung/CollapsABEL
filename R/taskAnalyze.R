taskAnalyze = function(hub, taskName) {
    hubtask = hub[[taskName]]
    tmplist = hubtask$plinkArgs
    tmplist$plinkcollFileStems = hubtask$shiftFilesStem
    do.call(plinkcollr, tmplist)
    # cleanLog(hubtask$taskPath)
}
