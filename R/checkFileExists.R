checkFileExists = function(filenames) {
    if(!is.character(filenames)) {
        stop("filenames must be a character vector.")
    }
    nonExistFiles = filenames[!file.exists(filenames)]
    if(length(nonExistFiles) > 0) {
        stop(sprintf("Non-existent file(s): \n%s", paste(nonExistFiles, collapse="\n")))
    }
    invisible(NULL)
}
