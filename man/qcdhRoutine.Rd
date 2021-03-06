% Generated by roxygen2 (4.0.2): do not edit by hand
\name{qcdhRoutine}
\alias{qcdhRoutine}
\title{QCDH routine 2}
\usage{
qcdhRoutine(wDir = ".", pheno, pheno_name, covar = NULL, covar_name,
  plinkArgs, initGwas = FALSE, initGwasArgs, pFilter, nMaxShift)
}
\arguments{
\item{wDir}{Working directory. All paths within this function will be relative to this.}

\item{pheno}{Phenotype file (usually also containing covariates)}

\item{pheno_name}{Name of phenotype in the phenotype file}

\item{covar}{Covariates file, default to the same as \code{pheno}}

\item{covar_name}{Name of covariates in the covariates file}

\item{plinkArgs}{Arguments to be passed to PLINK (in QCDH analysis)}

\item{initGwas}{Whether to perform an initial GWAS}

\item{initGwasArgs}{Arguments to pass to PLINK for the initial GWAS}

\item{pFilter}{Filter out SNPs with p value higher than this (in the initial GWAS)}

\item{nMaxShift}{Maximum shift number (for genotype collapsing)}
}
\value{
hubtask An environment containing info and results from the current task.
}
\description{
This routine generates arguments to be passed to PLINK and task name automatically,
then pass these to routine 1.
}

