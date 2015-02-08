#' Clean up SNP names for building linear models in R
#' 
#' Some SNPs have not been give formal "rs..." names, for example "6:24331878:I".
#' These names start with a number and contain the special char ":", so they are not suitable
#' for usage in R formulas. This function cleans them up.
#' @param x A vector of SNP names to clean up.
#' @return A cleanedup SNP names vector.
cleanSnpNames = function(x) {
    x = gsub(":", "AAA", x)
    x = gsub("^(\\d+)", "C\\1", x)
    x
}
