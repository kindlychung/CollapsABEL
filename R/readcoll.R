readcoll = function(hub, plinkOutExt) {
    if(missing(plinkOutExt)) {
        if(is.null(hub$plinkOutExt)) {
            stop("plinkOutExt is not provided and also not inferred in the hub.")
        }
    } else {
        if(is.null(hub$plinkOutExt)) {
            hub$plinkOutExt = plinkOutExt
        } else {
            if(plinkOutExt != hub$plinkOutExt) {
                warning("The plinkOutExt you provided differs from the one in the hub.")
                hub$plinkOutExt = plinkOutExt
            }
        }
    }

    hub$plinkOutFiles = sort(Sys.glob(paste(hub$shiftStemCommon, "*.", hub$plinkOutExt, sep="")))

    if(length(hub$plinkOutFiles) != length(hub$shiftFilesBed)) {
        stop("Analysis unfinished! (Or wrong plink output extension?)")
    }

    firstPlinkOut = hub$plinkOutFiles[1]
    ending = sprintf("_shift_0000.%s", hub$plinkOutExt)
    if(!grepl(ending, firstPlinkOut)) stop(sprintf("Something wrong with filenames, the first shifted bed filename should end with %s", ending))

    tmpChr = readplinkoutr(firstPlinkOut, "CHR")
    hub$nsnp = nrow(tmpChr)
    hub$chrunique = sort(unique(tmpChr[, 1]))

    # initialize some objects
    hub$minPvalsBonfer = 1
    hub$minPvals = 1
	hub$pvals   = matrix(, hub$nsnp, 0)
	hub$chr     = matrix(, hub$nsnp, 0)
	hub$snp     = matrix(, hub$nsnp, 0)
	hub$bp      = matrix(, hub$nsnp, 0)
	hub$chr2    = matrix(, hub$nsnp, 0)
	hub$snp2    = matrix(, hub$nsnp, 0)
	hub$bp2     = matrix(, hub$nsnp, 0)

    for(i in 1:length(hub$plinkOutFiles)) {
        plinkOutFile = hub$plinkOutFiles[i]
        appendFromPlinkOut(hub, plinkOutFile)
    }
    updateMinPvals(hub)
    updateSnp2Info(hub)

    invisible(NULL)
}

readcoll.task = function(hub, taskName, plinkOutExt) {
    readcoll(hub[[taskName]])
}
