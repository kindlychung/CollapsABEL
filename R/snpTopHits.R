snpTopHits.n = function(hub, nHits, threshold=5e-8, sameChr=TRUE, lowerPbonfer=TRUE) {
    # idx = order(hub$minPvalsBonfer)[1:nHits]

    res = cleanByChrPvalsBonfer(hub, threshold, sameChr, lowerPbonfer)

    hub$topSnpList = list()
    hub$topHitSummary = list()
    hub$topSnpFlank = list()
    chrunique = unique(res$chr)
    for(chrIter in chrunique) {
        label = sprintf("chr%02i", chrIter)
        chrdat = filter(res, chr == chrIter)
        chrdat = arrange(chrdat, pbonfer)
        nr = nrow(chrdat)
        if(nr > nHits) chrdat = chrdat[1:nHits, ]
        hub$topSnpList[[label]] = chrdat

        topsnp1 = chrdat$snp[1]
        topsnp2 = chrdat$snp2[1]
        topsnp1 = as.character(topsnp1)
        topsnp2 = as.character(topsnp2)
        topbp1 = chrdat$bp[1]
        topbp2 = chrdat$bp2[1]
        rownum1 = which(hub$snp[, 1] == topsnp1)
        rownum2 = which(hub$snp[, 1] == topsnp2)
        bpDist = abs(topbp1 - topbp2)
        summaryDat = data.frame(snp1 = topsnp1, snp2 = topsnp2,
                              bp1 = topbp1, bp2 = topbp2,
                              rownum1 = rownum1, rownum2 = rownum2,
                              bpDist = bpDist, stringsAsFactors = FALSE)
        hub$topHitSummary[[label]] = summaryDat

        rowlow = min(rownum1, rownum2)
        rowup = max(rownum1, rownum2)
        rowlow = ifelse(rowlow > 200, rowlow-200, rowlow)
        maxNrow = hub$nsnp
        rowup = ifelse((maxNrow-rowup > 200), rowup+200, maxNrow)
        idx = rowlow:rowup
        chrVec = hub$chr[idx, 1]
        snpVec = hub$snp[idx, 1]
        bpVec = hub$bp[idx, 1]
        pVec = hub$minPvalsBonfer[idx]
        flankDat = data.frame(CHR=chrVec, SNP=snpVec, BP=bpVec, P=pVec, stringsAsFactors = FALSE)
        flankDat = filter(flankDat, CHR == chrIter)
        flankDat$dist1 = flankDat$BP - topbp1
        flankDat$dist2 = flankDat$BP - topbp2
        idx = (flankDat$dist1 > -0.1e6) & (flankDat$dist2 < 0.1e6)
        flankDat = flankDat[which(idx), ]
        hub$topSnpFlank[[label]] = flankDat
    }
    invisible(NULL)
}
