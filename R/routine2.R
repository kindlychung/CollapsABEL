routine2 = function(wDir=".", pheno, pheno_name, covar=NULL, covar_name, plinkArgs, initGwas=FALSE, initGwasArgs, pFilter, nMaxShift) {
    if(is.null(covar)) covar = pheno
    checkFileExists(c(wDir, pheno, covar))
    if(!is.character(c(pheno_name, covar_name))) {
        stop("pheno_name and covar_name must be strings of variable names separated by comma.")
    }

    plinkArgs = within(plinkArgs, {
        pheno = pheno
        pheno_name = pheno_name
        covar = covar
        covar_name = covar_name
    })

    initGwasArgs = within(initGwasArgs, {
        pheno = pheno
        pheno_name = pheno_name
        assoc = ""
    })

    taskName = sprintf("%s_s%d_p%.2e", pheno_name, nMaxShift, pFilter)

    routine1(
        wDir = wDir,
        taskName = taskName,
        plinkArgs = plinkArgs,
        initGwasArgs = initGwasArgs,
        pFilter = pFilter,
        initGwas = initGwas,
        nMaxShift = nMaxShift
    )
}
