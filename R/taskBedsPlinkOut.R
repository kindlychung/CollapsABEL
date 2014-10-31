taskBedsPlinkOut = function(hub, taskName, plinkOutFile, pvalThresh=5e-2, nMinShift=1, nMaxShift) {
    hubtask = hub[[taskName]]
    hubtask$pvalThresh = pvalThresh
    hubtask$nMinShift = nMinShift
    hubtask$nMaxShift = nMaxShift
    pvalDat = readplinkoutr(plinkOutFile, c("SNP", "P"))
    hubtask$extractSnpVector = pvalDat$SNP[which(pvalDat$P < pvalThresh)]
    hubtask$extractSnpFile = paste( hub$bedStem, "_extract_by_p_", format(pvalThresh, scientific=TRUE), ".snplist", sep="")
    write.table(hubtask$extractSnpVector, file=hubtask$extractSnpFile, quote=FALSE, row.names=FALSE, col.names=FALSE)
    suppressWarnings({
        file.remove(c(hubtask$taskBedPath, hubtask$taskBimPath, hubtask$taskFamPath))
        file.remove(c(hubtask$taskShiftFilesBed, hubtask$taskShiftFilesBim, hubtask$taskShiftFilesFam))
    })
    tmplist = hubtask$plinkParamList
    tmplist$bfile = hub$bedStem
    tmplist$out = hubtask$taskBedStem
    tmplist$extract = hubtask$extractSnpFile
    tmplist$make_bed = ""
    do.call(plinkr, tmplist)
    bedcollr(bfile=hubtask$taskBedStem, nshift_min=nMinShift, nshift_max=nMaxShift)
    tmphub = collrinfo(wDir=hubtask$taskPath)
    updateShiftFiles(tmphub)
    updateTaskFileRecords(hub, taskName)

    invisible(NULL)
}
