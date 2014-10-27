updateSnp2Info = function(hub) {
    hub$chr2 = shiftDataByCol(hub$chr)
    hub$snp2 = shiftDataByCol(hub$snp)
    hub$bp2  = shiftDataByCol(hub$bp)
    invisible(NULL)
}
