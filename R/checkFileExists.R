checkFileExists = function(filename) {
    if(!file.exists(filename)) stop(sprintf("%s does not exist.", filename))
}