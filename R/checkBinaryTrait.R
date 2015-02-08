#' Check whether a trait is binary
#' 
#' @param v A vector to be checked
#' @param naVal A value for NA coding
#' @return A string. "bin" for binary, or "con" for continuous.
checkBinaryTrait = function(v, naVal="NA") {
    if(!is.numeric(v)) stop("Only numeric vectors are accepted.")
    vSet = unique(v)
    if(!missing(naVal)) vSet[which(vSet == naVal)] = NA
    vSet = vSet[which(!is.na(vSet))]
    if(any(as.integer(vSet) != vSet)) return("con")
    if(length(vSet) > 2) return("con")
    "bin"
}

## v = c(1, 1.1, 1, 1.1, NA)
## checkBinaryTrait(v)
## v = c(1, 2, 1, 2, NA)
## checkBinaryTrait(v)
## v = c(-9, 2.3, 4.1, -9, -9)
## checkBinaryTrait(v, -9)
## v = c(-9, 2, 4, -9, -9)
## checkBinaryTrait(v, -9)
