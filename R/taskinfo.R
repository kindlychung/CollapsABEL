#' Prepare paths and filenames for the task
#'
#' A hepler function for sorting out folder and file names for plots, shifted bed files etc.
#' It also figures out extension names of PLINK output.
#'
#' @param hub Environment. QCDH data hub.
#' @param taskName Character. Name of the task.
#' @param plinkArgs List. Arguments to be passed to PLINK
#' @param initGwasArgs List. Arguments to be passed to PLINK
#' @param initGwas Logical. Whether to perform a initial GWAS.
taskinfo = function(hub, taskName, plinkArgs, initGwasArgs, initGwas=FALSE) {
    hub[[taskName]] = new.env()
    hubtask = hub[[taskName]]

    hubtask$plinkArgs = plinkArgs
    hubtask$initGwasArgs = initGwasArgs

    hubtask$taskPath = file.path(hub$wDir, sprintf("task_%s", taskName))
    hubtask$taskPlotPath = file.path(hubtask$taskPath, "plots")
    if(file.exists(hubtask$taskPath)) unlink(hubtask$taskPath, recursive=TRUE, force=TRUE)
    if(file.exists(hubtask$taskPlotPath)) unlink(hubtask$taskPlotPath, recursive=TRUE, force=TRUE)
    dir.create(hubtask$taskPath)
    dir.create(hubtask$taskPlotPath)

    hubtask$bedStem = file.path(hubtask$taskPath, basename(hub$bedStem))
    ## hubtask$taskBedPath = sprintf("%s.bed", hubtask$taskBedStem)
    ## hubtask$taskFamPath = sprintf("%s.fam", hubtask$taskBedStem)
    ## hubtask$taskBimPath = sprintf("%s.bim", hubtask$taskBedStem)

    ## require(txtutils)
    ## require(collr2)
    ## setwd("~/Desktop/mmp")
    ## ## plinkArgs = getPlinkParam(allow_no_sex="", pheno="mmp13.phe", pheno_name="Cage")
    sample_pheno = readfwHead(filename = plinkArgs$pheno, colnameSelect = plinkArgs$pheno_name)
    sample_pheno[[1]] = as.numeric(sample_pheno[[1]])
    if(!is.null(plinkArgs$missing_phenotype))
        traitType = checkBinaryTrait(sample_pheno[[1]], plinkArgs$missing_phenotype)
    else
        traitType = checkBinaryTrait(sample_pheno[[1]])


    hubtask$plinkParamNames = names(hubtask$plinkArgs)
    hubtask$initPlinkArgNames = names(hubtask$initGwasArgs)
    if("linear" %in% hubtask$plinkParamNames)     hubtask$plinkOutExt    = "assoc.linear"
    if("logistic" %in% hubtask$plinkParamNames)   hubtask$plinkOutExt    = "assoc.logistic"
    if("linear" %in% hubtask$initPlinkArgNames)   hubtask$fullGwasOutExt = "assoc.linear"
    if("logistic" %in% hubtask$initPlinkArgNames) hubtask$fullGwasOutExt = "assoc.logistic"
    if("assoc" %in% hubtask$initPlinkArgNames) {
        if(traitType == "bin") hubtask$fullGwasOutExt = "assoc"
        else                   hubtask$fullGwasOutExt = "qassoc"
    }
    hubtask$fullGwasOutStem = file.path(hub$fullGwasDir, digest(hubtask$initGwasArgs))
    hubtask$fullGwasOut = sprintf("%s.%s", hubtask$fullGwasOutStem, hubtask$fullGwasOutExt)

    if(!file.exists(hubtask$fullGwasOut) || initGwas) {
        tmplist = hubtask$initGwasArgs
        tmplist$bfile = hub$bedStem
        tmplist$out   = hubtask$fullGwasOutStem
        do.call(plinkr, tmplist)
    } else {
        message("Full GWAS has already been run.")
    }

    invisible(NULL)
}
