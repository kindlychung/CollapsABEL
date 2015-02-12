#' QCDH routine 1
#'
#' This routine collects info on the working directory, performs an
#' initial GWAS as a basis for SNP selection by p values, generates
#' bed files with collapsed genotypes, analyzes them, and saves intermediate
#' and final results in an environment named after the task.
#' This routine is called by \code{qcdhRoutine}.
#'
#' @param wDir Working directory. All paths within this function will be relative to this.
#' @param taskName Name of the QCDH task.
#' @param plinkArgs Arguments to be passed to PLINK (in QCDH analysis)
#' @param initGwas Whether to perform an initial GWAS
#' @param initGwasArgs Arguments to pass to PLINK for the initial GWAS
#' @param pFilter Filter out SNPs with p value higher than this (in the initial GWAS)
#' @param nMaxShift Maximum shift number (for genotype collapsing)
#' @return hubtask An environment containing info and results from the current task.
routine1 = function(wDir=".", taskName, plinkArgs, initGwas=FALSE, initGwasArgs, pFilter=.05, nMaxShift) {
    setwd(wDir)
    # collect info
    hubcollr = collrinfo()
    bedcollinfo(hubcollr, genbed = FALSE)
    taskinfo(hubcollr, taskName, plinkArgs, initGwasArgs, initGwas)
    hubtask = hubcollr[[taskName]]
    checkFileExists(hubtask$fullGwasOut)

    taskBedsPlinkOut(hubcollr, taskName, hubtask$fullGwasOut, pFilter, 1, nMaxShift)
    taskAnalyze(hubcollr, taskName)
    readcoll.task(hubcollr, taskName)
    contrastPlot(hubtask)
    hubtask$taskContrastPlotFile = file.path(hubtask$taskPlotPath, "contrastPlot.png")
    ggsave(plot = hubtask$contrastPlotOut, filename = hubtask$taskContrastPlotFile, width=10, height=5)

    hubtask$workspaceImageFile = file.path(hubtask$taskPath, "taskWorkspace.RData")
    save(hubcollr, file=hubtask$workspaceImageFile)
    hubtask$contrastPlotOut
    invisible(hubtask)
}
