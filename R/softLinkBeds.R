softLinkBeds = function(hub, taskName) {
    hubtask = hub[[taskName]]
    taskPath = hubtask$taskPath
    linkedFiles = basename(hub$allMainShiftFiles)
    allMainShiftFilesRelativePath = file.path("..", linkedFiles)
    if(dbgtrigger()) {
        message("Linking to: ")
        print(allMainShiftFilesRelativePath)
        message("With: ")
        print(linkedFiles)
    }
    curDir = getwd()
    tryCatch({
        if(dbgtrigger()) cat("Setting CWD to ", taskPath, "\n")
        setwd(taskPath)
        if(any(file.exists(linkedFiles))) {
            wantRemove = readline("Some of the above files already exist, want to remove? ")
            wantRemove = str_trim(wantRemove)
            if(wantRemove == "yes") file.remove(linkedFiles)
        }
        file.symlink(allMainShiftFilesRelativePath, linkedFiles)
    },
        error = function(e) {print(e)},
        finally = {
            setwd(curDir)
    })
    
}
