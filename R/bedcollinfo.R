bedcollinfo = function(hub, genbed=FALSE, nShiftMin = 1, nShiftMax = 5) {
    if(genbed) {
        bedcollr(bfile = hub$bedStem, nshift_min = nShiftMin, nshift_max = nShiftMax)
    } 
    updateShiftFiles(hub)
    hub$allMainShiftFiles = Sys.glob(paste(hub$bedStem, "*", sep=""))
}
