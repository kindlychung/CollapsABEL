getNshiftStr = function(shiftpath) {
	nshiftStr = gsub(".*_shift_(\\d{4}).*", "\\1", shiftpath)
	nshiftStr
}
