contrastPlot = function(hub,
                        chrfilter=NULL,
                        bplower=NULL,
                        bpupper=NULL,
                        bonferroni=FALSE,
                        threshold=0.001,
                        sameChr=TRUE,
                        lowerPbonfer = FALSE,
                        forceRecalc = TRUE,
                        bpdiff = 5e5
                        ) {

    dat = cleanByChrPvalsBonfer(
                                hub = hub,
                                threshold = threshold,
                                sameChr = sameChr,
                                lowerPbonfer = lowerPbonfer,
                                forceRecalc = forceRecalc,
                                bpdiff = bpdiff
                                )

    # Take single-SNP data from hub, and QCDH data from dat
    filter0 = rep(TRUE, nrow(hub$chr))
    filter = rep(TRUE, nrow(dat))
    if(! is.null(chrfilter)) {
        filter0 = hub$chr[, 1] %in% chrfilter
        filter = dat$chr %in% chrfilter
    }
    if(! is.null(bplower)) {
        filter0 = filter0 & hub$bp[, 1] >= bplower
        filter = filter & dat$bp >= bplower
    }
    if(! is.null(bpupper)) {
        filter0 = filter0 & hub$bp[, 1] <= bpupper
        filter = filter & dat$bp <= bpupper
    }
    if(! is.null(threshold)) {
        filter0 = filter0 & hub$pvals[, 1] <= threshold
        filter = filter & dat$p <= threshold
    }

    filter0 = which(filter0)
    filter = which(filter)

    chrvec0 = hub$chr[filter0, 1]
    chrvec   = dat$chr[filter]
    bpvec0 = hub$bp[filter0, 1]
    bpvec    = dat$bp[filter]

    colorvec = c(rep("Single SNP", length(filter0)), rep("QCDH", length(filter)))

    basepvalsvec = hub$pvals[filter0, 1]
    if(bonferroni) {
        minpvalvec = dat$pbonfer[filter]
    } else {
        minpvalvec = dat$p[filter]
    }

    chrvec = c(chrvec0, chrvec)
    bpvec = c(bpvec0, bpvec)
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
