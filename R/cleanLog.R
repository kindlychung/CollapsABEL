cleanLog = function(dir=".", ext=c("log", "nosex"), verbose=FALSE) {
    for(extIter in ext) {
        filesToClean = Sys.glob(file.path(.self$taskPath, paste("*.", extIter, sep="")))
        filesExist = filesToClean[file.exists(filesToClean)]
        if(length(filesExist) > 0) {
            if(verbose) {
                print(filesExist)
                wantRemove = readline("Want to remove these files? (yes/no)")
                wantRemove = str_trim(wantRemove)
                if(wantRemove == "yes") file.remove(filesExist)
                else message("Abort")
            } else {
                file.remove(filesExist)
            }
        }
    }
}
