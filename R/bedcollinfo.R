bedcollinfo = function(hub, genbed=FALSE, nShiftMin = 1, nShiftMax = 5) {
    if(!is(hub, "collrinfo")) stop("bedcollinfo processes output from collrinfo!")
    class(hub)[2] = "bedcollinfo"
    if(genbed) {
        bedcollr(bfile = hub$bedStem, nshift_min = nShiftMin, nshift_max = nShiftMax)
    } 
    updateShiftFiles(hub)
    hub$allMainShiftFiles = Sys.glob(paste(hub$bedStem, "*", sep=""))
    class(hub)[2] = "bedcollinfo"

    invisible(NULL)
}

summary.bedcollinfo = function(hub) {
}
    
