#' Shift columns of a matrix
#' 
#' Column 1 is kept the same, column 2 is shifted upwards by 1 row, column 3 by 2, etc.
#' See \url{https://gist.github.com/kindlychung/757f816f5b2f9e8d36b8#file-shiftdatabycol_example-txt}
#' 
#' @param dat The matrix to be shifted.
#' @param The shifted matrix.
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
