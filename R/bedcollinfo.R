bedcollinfo = function(hub, genbed=FALSE, nShiftMin = 1, nShiftMax = 5) {
    if(!is(hub, "collrinfo")) stop("bedcollinfo processes output from collrinfo!")
    if(genbed) {
        bedcollr(bfile = hub$bedStem, nshift_min = nShiftMin, nshift_max = nShiftMax)
    } 
    suppressWarnings(updateShiftFiles(hub))
    hub$allMainShiftFiles = Sys.glob(paste(hub$bedStem, "*", sep=""))
    if(!is(hub, "bedcollinfo")) class(hub) = c(class(hub), "bedcollinfo")

    invisible(NULL)
}

summary.bedcollinfo = function(hub) {
    n = length(hub$shiftFilesBed)
    message("Shifted bed files: ")
    if(n > 6) {
        printhead = head(hub$shiftFilesBed, 3)
        printtail = tail(hub$shiftFilesBed, 3)
        printout = matrix(c(printhead, "⋮⋮⋮⋮⋮⋮⋮⋮⋮⋮⋮⋮⋮⋮⋮", printtail), ncol=1)
        catmat(printout)
    } else {
        catmat(matrix(hub$shiftFilesBed, ncol=1))
    }

    tryCatch({
        NextMethod()
    }, warning = function(w) {
    }, error = function(e) {
    }, finally = {
    })

    invisible(NULL)
}
    

