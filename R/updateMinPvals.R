#' Calculate minial p values for QCDH
#' 
#' This function calculates minimal p values for each collection of SNP pairs that share the same first SNP.
#' It imposes two conditions: (1) Each pair should be in the same chromosome. (2) The distance between each pair of
#' SNPs should be below a certain threshold (specified by user).
#' 
#' @param hub QCDH data hub
#' @param bpdiff Numeric. Upper bound of base position distance between a pair of SNPs.
#' 
updateMinPvals = function(hub, bpdiff=5e5) {
    # don't use those p values with BP distance too big
    hub$pvals[abs(hub$bp2 - hub$bp) > bpdiff] = NA
    # don't use those p value where SNP pair are from different chromosomes
    hub$pvals[hub$chr != hub$chr2] = NA
    
    hub$minPvals = do.call(pminNoNA, as.data.frame(hub$pvals))
    hub$ntests = apply(hub$pvals, 1, function(rowIter) {sum(!is.na(rowIter))})
    hub$minPvalsBonfer = hub$minPvals * hub$ntests
    hub$minPvalsBonfer = ifelse(hub$minPvalsBonfer > 1, 1, hub$minPvalsBonfer)
    invisible(NULL)
}
