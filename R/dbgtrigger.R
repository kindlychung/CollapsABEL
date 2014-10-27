#' Getting or setting a local boolean variable for debugging purposes
#'
#' Getting or setting a local boolean variable for debugging purposes, thanks to flodel on stackoverflow
#'
#' 
#' @param bool Logical value that you want to set. When not provided, return the value previously set (default to FALSE)
#' @export
#' @examples
#' dbgtrigger()
#' dbgtrigger(TRUE)
#' dbgtrigger()
dbgtrigger <- local({
    stored.value <- FALSE
    function(bool = NULL)
        if (is.null(bool)) {
            stored.value
        } else {
            stopifnot(is.logical(bool), length(bool) == 1L)
            stored.value <<- bool
        }
})

