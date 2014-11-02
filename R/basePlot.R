basePlot = function(hub, chrfilter=NULL, bplower=NULL, bpupper=NULL, pvallower=NULL, pvalupper=NULL) {
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
        chrvec   = hub$chr[filter, "0000"]
        bpvec    = hub$bp[filter, "0000"]
        pvalsvec = hub$pvals[filter, "0000"]
    } else {
        chrvec   = hub$chr[, "0000"]
        bpvec    = hub$bp[, "0000"]
        pvalsvec = hub$pvals[, "0000"]
    }
    
    resinfo = mqinfo(chr=chrvec, bp=bpvec, p=pvalsvec)
    suppressWarnings(mh(resinfo))
}
