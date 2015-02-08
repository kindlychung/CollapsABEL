#' Get the stem of a bed filename. 
#' 
#' Remove the ".bed" part.
#' 
#' @param pathname Character. Pathname of the bed file.
#' @return \code{pathname} without ".bed" extension.
getstem = function(pathname) {
	gsub("(.*?)\\.bed$", "\\1", pathname)
}
