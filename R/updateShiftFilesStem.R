updateShiftFiles = function(hub) {
    hub$shiftFilesBed = sort(Sys.glob(sprintf("%s*.bed", hub$shiftStemCommon)))
    if(length(hub$shiftFilesBed) > 0) {
        hub$shiftFilesStem = getstem(hub$shiftFilesBed)
        hub$shiftFilesBim = paste(hub$shiftFilesStem, ".bim", sep="")
        hub$shiftFilesFam = paste(hub$shiftFilesStem, ".fam", sep="")
    }
    if(!all(file.exists(hub$shiftFilesBim) || !all(file.exists(hub$shiftFilesFam)))) {
        updateBimFam(hub)
    }

    # get shift numbers
    hub$nShiftStrs = getNshiftStr(hub$shiftFilesStem)
    hub$nShift = as.integer(hub$nShiftStrs)
    hub$nTotalShifts = length(hub$shiftFilesStem)
    
    if(dbgtrigger()) {
        message("List of shifted bed files:")
        print(hub$shiftFilesBed)
    }
    invisible(NULL)
}
