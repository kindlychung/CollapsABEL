bedcollinfo = function(hub, genbed=FALSE, nShiftMin = 1, nShiftMax = 5) {
    if(!is(hub, "collrinfo")) stop("bedcollinfo processes output from collrinfo!")
    if(genbed) {
        bedcollr(bfile = hub$bedStem, nshift_min = nShiftMin, nshift_max = nShiftMax)
    } 

    hub$shiftFilesBed = sort(Sys.glob(sprintf("%s*.bed", hub$shiftStemCommon)))
    if(length(hub$shiftFilesBed) > 0) {
        hub$shiftFilesStem = getstem(hub$shiftFilesBed)
        hub$shiftFilesBim = paste(hub$shiftFilesStem, ".bim", sep="")
        hub$shiftFilesFam = paste(hub$shiftFilesStem, ".fam", sep="")

        # get shift numbers, right at this stage, _shift_0000 files are not counted
        hub$nShiftStrs = getNshiftStr(hub$shiftFilesStem)
        hub$nShift = as.integer(hub$nShiftStrs)
        hub$nTotalShifts = length(hub$shiftFilesStem)

        # special 0 shift files, all symlinks
        shift0BedFile = paste(hub$bedStem, "_shift_0000.bed", sep="")
        shift0FamFile = paste(hub$bedStem, "_shift_0000.fam", sep="")
        shift0BimFile = paste(hub$bedStem, "_shift_0000.bim", sep="")

        rmList = c(shift0FamFile, shift0FamFile, shift0BimFile, hub$shiftFilesBim, hub$shiftFilesFam)
        rmList = rmList[file.exists(rmList)]
        if(length(rmList) > 0) file.remove(rmList)

        # Linking bim and fam files
        currentDir = getwd()
        tryCatch({
                    setwd(hub$wDir)

                    bedBase = basename(hub$bedPath)
                    famBase = basename(hub$famPath)
                    bimBase = basename(hub$bimPath)

                    shiftBaseBed = basename(hub$shiftFilesBed)
                    shiftBaseFam = basename(hub$shiftFilesFam)
                    shiftBaseBim = basename(hub$shiftFilesBim)

                    shift0BedBase = basename(shift0BedFile)
                    shift0BimBase = basename(shift0BimFile)
                    shift0FamBase = basename(shift0FamFile)

                    file.symlink(bedBase, shift0BedBase)
                    file.symlink(famBase, shift0FamBase)
                    file.symlink(bimBase, shift0BimBase)

                    file.symlink(famBase, shiftBaseFam)
                    file.symlink(bimBase, shiftBaseBim)

                    }, 
                    error = function(e) {
                        message("Error in updateBimFam!")
                        return(invisible(FALSE))
                    }, 
                    finally = {
                        setwd(currentDir)
                    })

        hub$shiftFilesBed = sort(Sys.glob(sprintf("%s*.bed", hub$shiftStemCommon)))
        hub$shiftFilesStem = getstem(hub$shiftFilesBed)
        hub$shiftFilesBim = paste(hub$shiftFilesStem, ".bim", sep="")
        hub$shiftFilesFam = paste(hub$shiftFilesStem, ".fam", sep="")
    }



    hub$allMainShiftFiles = Sys.glob(paste(hub$bedStem, "*", sep=""))
    if(!is(hub, "bedcollinfo")) class(hub) = c(class(hub), "bedcollinfo")

    invisible(NULL)
}

## summary.bedcollinfo = function(hub) {
##     n = length(hub$shiftFilesBed)
##     message("Shifted bed files: ")
##     if(n > 6) {
##         printhead = head(hub$shiftFilesBed, 3)
##         printtail = tail(hub$shiftFilesBed, 3)
##         printout = matrix(c(printhead, "⋮⋮⋮⋮⋮⋮⋮⋮⋮⋮⋮⋮⋮⋮⋮", printtail), ncol=1)
##         catmat(printout)
##     } else {
##         catmat(matrix(hub$shiftFilesBed, ncol=1))
##     }
##     NextMethod()
##     invisible(NULL)
## }
    

