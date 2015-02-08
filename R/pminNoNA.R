# A wrapper of \code{pmin}, removing NAs.
pminNoNA = function(...) {
    pmin(..., na.rm = TRUE)
}
