shiftDataByCol = function(dat) {
    nr = nrow(dat)
    nc = ncol(dat)
    newdat = matrix(NA, nr, nc)
    for(i in 1:nc) {
        colShiftN = as.integer(colnames(dat)[i])
        newdat[1:(nr-colShiftN), i] = dat[(colShiftN+1):nr, 1]
    }
    colnames(newdat) = colnames(dat)
    invisible(newdat)
}
