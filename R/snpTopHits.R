snpTopHits.n = function(hub, nHits) {
    # idx = order(hub$minPvalsBonfer)[1:nHits]
    idx = which(hub$minPvalsBonfer < 5e-8)
    extractMinPvals = hub$minPvals[idx]
    extractMinPvalsBonfer = hub$minPvalsBonfer[idx]

    pbase = hub$pvals[, 1]
    pbase = as.vector(pbase)
    snpNames = hub$snp[, 1]
    names(pbase) = snpNames
    extractPbase = pbase[idx]

    extractChr = hub$chr[idx, ]
    extractChr2 = hub$chr2[idx, ]
    extractSnp = hub$snp[idx, ]
    extractSnp2 = hub$snp2[idx, ]
    extractBp = hub$bp[idx, ]
    extractBp2 = hub$bp2[idx, ]
    extractPvals = hub$pvals[idx, ]

    minPvalIdx = apply(extractPvals, 1, which.min)
    minPvalIdxMat = cbind(1:nrow(extractPvals), minPvalIdx)
    minPvalSnp = extractSnp[minPvalIdxMat]
    minPvalSnp2 = extractSnp2[minPvalIdxMat]
    minPvalChr = extractChr[minPvalIdxMat]
    minPvalChr2 = extractChr2[minPvalIdxMat]
    minPvalBp = extractBp[minPvalIdxMat]
    minPvalBp2 = extractBp2[minPvalIdxMat]

    extractPbase2 = pbase[minPvalSnp2]

    res = data.frame(chr = minPvalChr, snp = minPvalSnp, bp = minPvalBp,
            chr2 = minPvalChr2, snp2 = minPvalSnp2, bp2 = minPvalBp2,
            p = extractMinPvals, pbonfer = extractMinPvalsBonfer,
            pbase1 = extractPbase, pbase2 = extractPbase2, stringsAsFactors=FALSE)
    idx = (res$chr == res$chr2)
    idx = idx & (res$pbonfer < res$pbase1) & (res$pbonfer < res$pbase2)
    res = res[idx, ]

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
