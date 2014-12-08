bedcollr = function(bfile=NULL, nshift_min=1, nshift_max=NULL) {
    checkFileExists(sprintf("%s.bed", bfile))
    message(sprintf("Shifting bed file: %s", bfile))

	paramList = mget(names(formals()),sys.frame(sys.nframe()))
	paramVector = unlist(paramList)
	paramVector = paramVector[!is.null(paramVector)]
	paramVector = str_trim(paramVector)

	paramName = names(paramVector)
	names(paramVector) = NULL
	paramName = paste("--", paramName, sep="")

	nParam = length(paramName)
	idxOdd = seq(1, nParam * 2, 2)
	idxEven = seq(2, nParam * 2, 2)
	paramNameWithValue = character(nParam * 2)
	paramNameWithValue[idxOdd] = paramName
	paramNameWithValue[idxEven] = paramVector
    system2("bedcoll", paramNameWithValue)

    invisible(NULL)
}
