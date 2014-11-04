shuffleLines = function(infn, outfn) {
    charVec = readLines(infn)
    charVec = sample(charVec)
    writeLines(charVec, con=outfn)
}
