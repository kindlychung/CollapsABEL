contrastPlot = function(hub, chrfilter=NULL, bplower=NULL, bpupper=NULL, pvallower=NULL, pvalupper=NULL, bonferroni=TRUE) {
    filter = rep(TRUE, hub$nsnp)
    filtered = FALSE
    if(! is.null(chrfilter)) {
        #debugps(paste("Filtering by chromosome, as you requested..."))
        filter = hub$chr[, 1] %in% chrfilter
        filtered = TRUE
    }
    if(! is.null(bplower)) {
        #debugps(paste("Filtering by bp lower limit, as you requested..."))
        filter = filter & hub$bp[, 1] >= bplower
        filtered = TRUE
    }
    if(! is.null(bpupper)) {
        #debugps(paste("Filtering by bp upper limit, as you requested..."))
        filter = filter & hub$ bp[, 1] <= bpupper
        filtered = TRUE
    }
    if(! is.null(pvallower)) {
        #debugps(paste("Filtering by pval lower limit, as you requested..."))
        filter = filter & hub$pvals[, 1] > pvallower
        filtered = TRUE
    }
    if(! is.null(pvalupper)) {
        #debugps(paste("Filtering by pval upper limit, as you requested..."))
        filter = filter & hub$pvals[, 1] < pvalupper
        filtered = TRUE
    }

    if(filtered) {
        filter = which(filter)
        colorvec = rep(c("Single SNP", "QCDH"), each=length(filter))
        chrvec   = hub$chr[filter, "0000"]
        bpvec    = hub$bp[filter, "0000"]
        basepvalsvec = hub$pvals[filter, "0000"]
        if(bonferroni) {
            minpvalvec = hub$minPvalsBonfer[filter]
        } else {
            minpvalvec = hub$minPvals[filter]
        }
    } else {
        colorvec = rep(c("Single SNP", "QCDH"), each=hub$nsnp)
        chrvec   = hub$chr[, "0000"]
        bpvec    = hub$bp[, "0000"]
        basepvalsvec = hub$pvals[, "0000"]
        if(bonferroni) {
            minpvalvec = hub$minPvalsBonfer
        } else {
            minpvalvec = hub$minPvals
        }
    }
    chrvec = c(chrvec, chrvec)
    bpvec = c(bpvec, bpvec)
    pvalsvec = c(basepvalsvec, minpvalvec)

    posorder = order(chrvec, bpvec)
    chrvec = chrvec[posorder]
    bpvec = bpvec[posorder]
    pvalsvec = pvalsvec[posorder]
    colorvec = colorvec[posorder]
    
    resinfo = mqinfo(chr=chrvec, bp=bpvec, p=pvalsvec, colorvec=colorvec)
    suppressWarnings(mh(resinfo))
}
