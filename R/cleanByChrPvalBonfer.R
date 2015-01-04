cleanByChrPvalsBonfer = function(
                                 hub, 
                                 threshold=5e-8, 
                                 sameChr=TRUE, 
                                 lowerPbonfer=FALSE, 
                                 forceRecalc = TRUE, 
                                 bpdiff=5e5
                                 ) {
    if(is.null(hub$cleanedUpDat) || forceRecalc) {

        idx = which(hub$minPvals < threshold)
        if(length(idx) == 0) {
            warning(sprintf("No p values below the threshold: %f", threshold))
            return(NULL)
        }

        extractMinPvals = hub$minPvals[idx]
        extractMinPvalsBonfer = hub$minPvalsBonfer[idx]

        # Single-SNP p values, with SNP names labeled
        pbase = hub$pvals[, 1]
        snpNames = hub$snp[, 1]
        names(pbase) = snpNames
        extractPbase = pbase[idx]

        # submatrix of chr, chr2, snp, snp2, bp, bp2, pvals
        # with minimal pvals less than threshold
        extractChr = hub$chr[idx, ]
        extractChr2 = hub$chr2[idx, ]
        extractSnp = hub$snp[idx, ]
        extractSnp2 = hub$snp2[idx, ]
        extractBp = hub$bp[idx, ]
        extractBp2 = hub$bp2[idx, ]
        extractPvals = hub$pvals[idx, ]

        # index of minal pvals
        minPvalIdx = apply(extractPvals, 1, which.min)
        minPvalIdxMat = cbind(1:nrow(extractPvals), minPvalIdx)

        # extract info for the SNP pair with minimal pval
        minPvalSnp = extractSnp[minPvalIdxMat]
        minPvalSnp2 = extractSnp2[minPvalIdxMat]
        minPvalChr = extractChr[minPvalIdxMat]
        minPvalChr2 = extractChr2[minPvalIdxMat]
        minPvalBp = extractBp[minPvalIdxMat]
        minPvalBp2 = extractBp2[minPvalIdxMat]

        extractPbase2 = pbase[minPvalSnp2]

        res = data.frame(chr = minPvalChr, snp = minPvalSnp, bp = minPvalBp,
                chr2 = minPvalChr2, snp2 = minPvalSnp2, bp2 = minPvalBp2,
                bpdiff = minPvalBp2 - minPvalBp,
                p = extractMinPvals, pbonfer = extractMinPvalsBonfer,
                pbase1 = extractPbase, pbase2 = extractPbase2, stringsAsFactors=FALSE)


        idx = rep(TRUE, nrow(res))
        if(sameChr) {
            idx = idx & (res$chr == res$chr2)
        }
        if(lowerPbonfer) {
            idx = idx & (res$p < res$pbase1) & (res$pbonfer < res$pbase2)
        }
        idx = idx & (res$bpdiff < bpdiff)
        res = res[idx, ]
        hub$cleanedUpDat = res
        res
    } else {
        hub$cleanedUpDat
    }
}
