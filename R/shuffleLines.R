# Shuffle the lines of a whitespace delimited file
shuffleLines = function(phenoFileOrig, phenoFile, shuffleVar) {
    tab = read.table(phenoFileOrig, head=TRUE)
    # print(head(tab, 10))
    tab[, shuffleVar] = sample(tab[, shuffleVar])
    # print(head(tab, 10))
    write.table(tab, phenoFile, quote = FALSE, row.names = FALSE)
}