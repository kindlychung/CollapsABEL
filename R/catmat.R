#' Print out a matrix, in a clean format
#' 
#' @param m The matrix to be printed.
#' @export
catmat <- function(m){
    write.table(format(m, justify="right"), row.names=F, col.names=F, quote=F)
}
