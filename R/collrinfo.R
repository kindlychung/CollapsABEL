collrinfo = function(wDir=".") {
    hub = new.env()
    class(hub) = c(class(hub), "collrinfo")
    hub$wDir = wDir
    hub$tmpdir = homeTmpDir()
    rootAllBedFiles = Sys.glob(file.path(wDir, "*.bed"))
    shiftIdx = grepl("_shift_", rootAllBedFiles)
    rootNonShiftBedFiles = rootAllBedFiles[!shiftIdx]
    rootShiftBedFiles = rootAllBedFiles[shiftIdx]

    # make sure all shifted bed files share same stem
    if(length(rootShiftBedFiles) > 0) {
        allStemsWithoutShift = gsub("_shift_.*", "", rootShiftBedFiles)
        if(length(unique(allStemsWithoutShift)) > 1) {
            stop("Mixed shifted bed files!")
        }
    }

    # make sure there is only one unshifted bed file in root
    nNonShift = length(rootNonShiftBedFiles)
    if(nNonShift > 1) {
        stop("Only one main bed file allowed!")
    } else if(nNonShift < 1) {
        stop("No main bed file found!")
    }

    # get main bim/fam/bed files
    hub$bedPath = rootNonShiftBedFiles
    hub$bedStem = getstem(hub$bedPath)
    hub$famPath = sprintf("%s.fam", hub$bedStem)
    hub$bimPath = sprintf("%s.bim", hub$bedStem)
    hub$allMainFiles = Sys.glob(sprintf("%s.*", hub$bedStem))

    if(dbgtrigger()) {
        message(sprintf("Main bed file: %s", hub$bedPath))
        message(sprintf("Main fam file: %s", hub$famPath))
        message(sprintf("Main bim file: %s", hub$bimPath))
    }

    # make sure the main .bed, .bim, .fam files all exist
    hub$mainPlinkFiles = c(hub$bedPath, hub$famPath, hub$bimPath)
    if(!all(file.exists(hub$mainPlinkFiles))) {
        print(hub$mainPlinkFiles)
        stop("One or more of the above files are missing!")
    }     

    hub$shiftStemCommon = sprintf("%s_shift_", hub$bedStem)

    hub
}

summary.collrinfo = function(hub) {
    message("Main plink files:")
    print(hub$mainPlinkFiles)
}
