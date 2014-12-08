taskBedsPlinkOut = function(hub, taskName, plinkOutFile, pvalThresh=5e-2, nMinShift=1, nMaxShift) {
    hubtask = hub[[taskName]]
    hubtask$pvalThresh = pvalThresh
    hubtask$nMinShift = nMinShift
    hubtask$nMaxShift = nMaxShift
    checkFileExists(plinkOutFile)
    message(sprintf("Reading p values from plink result file: %s", plinkOutFile))
    pvalDat = readplinkoutr(plinkOutFile, c("SNP", "P"))
    
    message(sprintf("Extracting SNPs based on P values, threshold: %f...", pvalThresh))
    hubtask$extractSnpVector = pvalDat$SNP[which(pvalDat$P < pvalThresh)]
    hubtask$extractSnpFile = paste( hubtask$bedStem, "_extract_by_p_", format(pvalThresh, scientific=TRUE), ".snplist", sep="")
    write.table(hubtask$extractSnpVector, file=hubtask$extractSnpFile, quote=FALSE, row.names=FALSE, col.names=FALSE)
    ## suppressWarnings({
    ##     file.remove(c(hubtask$taskBedPath, hubtask$taskBimPath, hubtask$taskFamPath))
    ##     file.remove(c(hubtask$taskShiftFilesBed, hubtask$taskShiftFilesBim, hubtask$taskShiftFilesFam))
    ## })
    tmplist = list()
    tmplist$bfile = hub$bedStem
    tmplist$out = hubtask$bedStem
    tmplist$extract = hubtask$extractSnpFile
    tmplist$make_bed = ""
    
    message("Generating new plink files based on extracted SNPs...")
    do.call(plinkr, tmplist)

    tmphub = collrinfo(wDir=hubtask$taskPath)
    bedcollinfo(tmphub, TRUE, hubtask$nMinShift, hubtask$nMaxShift)
    suppressWarnings(appendEnv(hubtask, tmphub))

    invisible(NULL)
}
