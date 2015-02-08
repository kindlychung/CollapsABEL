# create symlinks for bim and fam files.
updateBimFam = function(hub) {
    # create symlinks for bim and fam files
    shift0BedFile = paste(hub$bedStem, "_shift_0000.bed", sep="")
    shift0FamFile = paste(hub$bedStem, "_shift_0000.fam", sep="")
    shift0BimFile = paste(hub$bedStem, "_shift_0000.bim", sep="")
    file.remove(c(shift0FamFile, shift0FamFile, shift0BimFile))
    file.remove(hub$shiftFilesBim)
    file.remove(hub$shiftFilesFam)

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
    invisible(TRUE)
}
