#' Extract shift number (as a string) from a shifted bed filename
#' 
#' @param shiftpath Path name of the shifted bed file.
#' @return nshiftStr A string-representation of the shift number ("0000" for zero-shift)
getNshiftStr = function(shiftpath) {
	nshiftStr = gsub(".*_shift_(\\d{4}).*", "\\1", shiftpath)
	nshiftStr
}
