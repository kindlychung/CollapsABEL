readcoll = function(hub, plinkOutExt = "assoc.linear") {
    hub$plinkOutExt = plinkOutExt
    hub$outRdata = paste(.self$bedStem, ".RData", sep="")
    hub$plinkOutFiles = sort(Sys.glob(paste(hub$shiftStemCommon, "*.", hub$plinkOutExt, sep="")))
    if(length(hub$plinkOutFiles) != length(hub$shiftFilesBed)) stop("Finish your analysis first!")
    firstPlinkOut = hub$plinkOutFiles[1]
    tmpChr = readplinkoutr(firstPlinkOut, "CHR")
    hub$nsnp = nrow(tmpChr)
    hub$chrunique = sort(unique(tmpChr[, 1]))

    # initialize some objects
    hub$minPvalsBonfer = 1
    hub$minPvals = 1
	hub$pvals   = matrix(, .self$nsnp, 0)
	hub$chr     = matrix(, .self$nsnp, 0)
	hub$snp     = matrix(, .self$nsnp, 0)
	hub$bp      = matrix(, .self$nsnp, 0)
	hub$chr2    = matrix(, .self$nsnp, 0)
	hub$snp2    = matrix(, .self$nsnp, 0)
	hub$bp2     = matrix(, .self$nsnp, 0)

    for(i in 1:length(hub$plinkOutFiles)) {
        plinkOutFile = hub$plinkOutFiles[i]
        appendFromPlinkOut(hub, plinkOutFile)
    }
    updateMinPvals(hub)
    updateSnp2Info(hub)
}
