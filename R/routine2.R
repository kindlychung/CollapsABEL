#' QCDH routine 2
#' 
#' This routine generates arguments to be passed to PLINK and task name automatically, 
#' then pass these to routine 1.
#'
#' @param wDir Working directory. All paths within this function will be relative to this.
#' @param pheno Phenotype file (usually also containing covariates)
#' @param pheno_name Name of phenotype in the phenotype file
#' @param covar Covariates file, default to the same as \code{pheno}
#' @param covar_name Name of covariates in the covariates file
#' @param plinkArgs Arguments to be passed to PLINK (in QCDH analysis)
#' @param initGwas Whether to perform an initial GWAS
#' @param initGwasArgs Arguments to pass to PLINK for the initial GWAS
#' @param pFilter Filter out SNPs with p value higher than this (in the initial GWAS)
#' @param nMaxShift Maximum shift number (for genotype collapsing)
#' @return hubtask An environment containing info and results from the current task.
#' @export
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

    taskName = sprintf("%s-%s_s%d_p%.2e", pheno_name, plinkArgs$covar_name, nMaxShift, pFilter)

    hubtask = routine1(
        wDir = wDir,
        taskName = taskName,
        plinkArgs = plinkArgs,
        initGwasArgs = initGwasArgs,
        pFilter = pFilter,
        initGwas = initGwas,
        nMaxShift = nMaxShift
    )
    invisible(hubtask)
}
