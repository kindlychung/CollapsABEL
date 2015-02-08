#' Analyze shifted bed files 
#' 
#' @param hub Environment. QCDH data hub
#' @param taskName Character. Name of the task.
taskAnalyze = function(hub, taskName) {
    hubtask = hub[[taskName]]
    tmplist = hubtask$plinkArgs
    tmplist$plinkcollFileStems = hubtask$shiftFilesStem
    do.call(plinkcollr, tmplist)
    # cleanLog(hubtask$taskPath)
}
