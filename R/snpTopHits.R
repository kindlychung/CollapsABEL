snpTopHits.n = function(hub, nHits) {
    idx = order(hub$minPvals)[1:nHits]
    debugps("Getting top hits by minimal p value... ")

    extractMinPvals = hub$minPvals[idx]
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

    res = data.frame(chr = minPvalChr, snp = minPvalSnp, bp = minPvalBp,
            chr2 = minPvalChr2, snp2 = minPvalSnp2, bp2 = minPvalBp2,
            p = extractMinPvals)
    invisible(res)
}
