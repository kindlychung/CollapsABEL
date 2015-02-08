#' Contrast QCDH p values with single-SNP p values
#' 
#' @param hub QCDH data hub
#' @param chrfilter Numeric. A vector of chromosome numbers. If present, then only SNPs in these chromosomes are selected. Default to NULL.
#' @param bplower Numeric. If present, then only SNPs with base position greater than it will selected. Default to NULL.
#' @param bpupper Numeric. If present, then only SNPs with base position less than it will selected. Default to NULL.
#' @param pvallower Numeric. If present, then only SNPs with p values higher than it will be plotted in the single-SNP part. Default to NULL.
#' @param pvalupper Numeric. If present, then only SNPs with p values lower than it will be plotted in the single-SNP part. Default to NULL.
#' @param bonferroni Logical. If present, then the QCDH p values will be adjusted by Bonferroni correction.  Default to NULL.
#' @return A ggplot object of contrast Manhattan plot. (This plot is also stored in the QCDH data hub.)
contrastPlot = function(hub, chrfilter=NULL, bplower=NULL, bpupper=NULL, pvallower=NULL, pvalupper=NULL, bonferroni=FALSE) {
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
    hub$contrastPlotOut = suppressWarnings(mh(resinfo))
    hub$contrastPlotOut
}
