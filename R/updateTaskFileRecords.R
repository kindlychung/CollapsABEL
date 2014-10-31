updateTaskFileRecords = function(hub, taskName) {
    hubtask = hub[[taskName]]
    hubtask$taskShiftFilesBed   = Sys.glob(paste(hubtask$taskBedStem, "_shift_*.bed", sep=""))
    hubtask$taskShiftFilesStem  = getstem(taskShiftFilesBed)
    hubtask$taskShiftFilesBim   = Sys.glob(paste(hubtask$taskBedStem, "_shift_*.bim", sep=""))
    hubtask$taskShiftFilesFam   = Sys.glob(paste(hubtask$taskBedStem, "_shift_*.fam", sep=""))
    hubtask$taskMainFiles       = Sys.glob(paste(hubtask$taskBedStem, ".*", sep=""))
    hubtask$taskMainShiftFiles  = Sys.glob(paste(hubtask$taskBedStem, "*", sep=""))
}
