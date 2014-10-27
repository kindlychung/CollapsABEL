updateMinPvals = function(hub) {
    hub$minPvals = do.call(pminNoNA, as.data.frame(hub$pvals))
    hub$ntests = apply(hub$pvals, 1, function(rowIter) {sum(!is.na(rowIter))})
    hub$minPvalsBonfer = hub$minPvals * hub$ntests
    hub$minPvalsBonfer = ifelse(hub$minPvalsBonfer > 1, 1, hub$minPvalsBonfer)
    invisible(NULL)
}
