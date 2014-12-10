contrastPlot = function(hub,
                        chrfilter=NULL,
                        bplower=NULL,
                        bpupper=NULL,
                        bonferroni=FALSE
                        threshold=0.001,
                        sameChr=TRUE,
                        lowerPbonfer = FALSE,
                        forceRecalc = TRUE
                        ) {

    dat = cleanByChrPvalsBonfer(
                                hub = hub,
                                threshold = threshold,
                                sameChr = sameChr,
                                lowerPbonfer = lowerPbonfer,
                                forceRecalc = forceRecalc
                                )

    filter = rep(TRUE, nrow(dat))
    filtered = FALSE
    if(! is.null(chrfilter)) {
        filter = dat$chr %in% chrfilter
        # filtered = TRUE
    }
    if(! is.null(bplower)) {
        #debugps(paste("Filtering by bp lower limit, as you requested..."))
        filter = filter & dat$bp >= bplower
        # filtered = TRUE
    }
    if(! is.null(bpupper)) {
        #debugps(paste("Filtering by bp upper limit, as you requested..."))
        filter = filter & dat$bp <= bpupper
        # filtered = TRUE
    }

    filter = which(filter)
    colorvec = rep(c("Single SNP", "QCDH"), each=length(filter))
    chrvec   = dat$chr[filter]
    bpvec    = dat$bp[filter]
    basepvalsvec = dat$pbase1[filter]
    if(bonferroni) {
        minpvalvec = dat$p[filter]
    } else {
        minpvalvec = dat$pbonfer[filter]
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
