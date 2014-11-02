require(devtools)
install_bitbucket("kindlychung/txtutils")
# install_bitbucket("kindlychung/manqq2")
# install_github("kindlychung/gmailR")
# install_bitbucket("kindlychung/autoGmail")
install_bitbucket("kindlychung/collr2")

setwd("~/Desktop/mmp3")
hubcollr = collrinfo()
summary(hubcollr)
# bedcollinfo(hubcollr, genbed = TRUE, nShiftMin = 1, nShiftMax = 5)
bedcollinfo(hubcollr, genbed = FALSE, nShiftMin = 1, nShiftMax = 5)
plinkargs = getPlinkParam(allow_no_sex = "", pheno = "mmp13.phe", pheno_name = "Page", covar = "mmp13.phe", covar_name = "Sex,Cage", linear = "hide-covar")
qcfilter = getPlinkParam(maf=.01, hwe=1e-4)
taskinfo(hubcollr, "test1", plinkargs, qcfilter, TRUE)
taskBedsPlinkOut(hubcollr, "test1", "collr_task_test1/mmp13.assoc.linear", .1, 1, 10)
taskAnalyze(hubcollr, "test1")
readcoll.task(hubcollr, "test1")
basePlot(hubcollr$test1)
minPlot(hubcollr$test1)
contrastPlot(hubcollr$test1)

setwd("~/Desktop/mmp3")
hubcollr = collrinfo()
# bedcollinfo(hubcollr, genbed = TRUE, nShiftMin = 1, nShiftMax = 5)
bedcollinfo(hubcollr, genbed = FALSE)
plinkargs = getPlinkParam(allow_no_sex = "", pheno = "mmp13.phe", pheno_name = "Page", covar = "mmp13.phe", covar_name = "Sex,Cage", linear = "hide-covar")
qcfilter = getPlinkParam(maf=.01, hwe=1e-4, allow_no_sex = "", pheno = "mmp13.phe", pheno_name = "Page", assoc= "")
taskinfo(hubcollr, "test2", plinkargs, qcfilter, TRUE, "bin")
taskBedsPlinkOut(hubcollr, "test2", "collr_task_test2/mmp13.qassoc", .1, 1, 10)
taskAnalyze(hubcollr, "test2")
readcoll.task(hubcollr, "test2")
contrastPlot(hubcollr$test2)

plinkArgs    = getPlinkParam(allow_no_sex = "", pheno = "mmp13.phe", pheno_name = "Page", covar = "mmp13.phe", covar_name = "Sex,Cage", linear = "hide-covar")
initGwasArgs = getPlinkParam(maf=.01, hwe=1e-4, allow_no_sex = "", pheno = "mmp13.phe", pheno_name = "Page", assoc= "")
crt1("~/Desktop/mmp3", "test3", plinkArgs, initGwasArgs, TRUE, "con", 0.1)
debug(crt1)
debug(taskinfo)


hubcollr$test1$nsnp
hubcollr$test1$bp[1:10, 1:10]
hubcollr$test1$bp2[1:10, 1:10]
hubcollr$test1$snp[1:10, 1:10]
hubcollr$test1$snp2[1:10, 1:10]

options(warn = 2, keep.source = TRUE, error = 
            quote({ 
                cat("Environment:\n", file=stderr()); 
                
                # TODO: setup option for dumping to a file (?)
                # Set `to.file` argument to write this to a file for post-mortem debugging    
                dump.frames();  # writes to last.dump
                
                #
                # Debugging in R
                #   http://www.stats.uwo.ca/faculty/murdoch/software/debuggingR/index.shtml
                #
                # Post-mortem debugging
                #   http://www.stats.uwo.ca/faculty/murdoch/software/debuggingR/pmd.shtml
                #
                # Relation functions:
                #   dump.frames
                #   recover
                # >>limitedLabels  (formatting of the dump with source/line numbers)
                #   sys.frame (and associated)
                #   traceback
                #   geterrmessage
                #
                # Output based on the debugger function definition.
                
                n <- length(last.dump)
                calls <- names(last.dump)
                cat(paste("  ", 1L:n, ": ", calls, sep = ""), sep = "\n", file=stderr())
                cat("\n", file=stderr())
                
                if (!interactive()) {
                    q()
                }
            }),
        warning.expression =             quote({ 
            cat("Environment:\n", file=stderr()); 
            
            # TODO: setup option for dumping to a file (?)
            # Set `to.file` argument to write this to a file for post-mortem debugging    
            dump.frames();  # writes to last.dump
            
            #
            # Debugging in R
            #   http://www.stats.uwo.ca/faculty/murdoch/software/debuggingR/index.shtml
            #
            # Post-mortem debugging
            #   http://www.stats.uwo.ca/faculty/murdoch/software/debuggingR/pmd.shtml
            #
            # Relation functions:
            #   dump.frames
            #   recover
            # >>limitedLabels  (formatting of the dump with source/line numbers)
            #   sys.frame (and associated)
            #   traceback
            #   geterrmessage
            #
            # Output based on the debugger function definition.
            
            n <- length(last.dump)
            calls <- names(last.dump)
            cat(paste("  ", 1L:n, ": ", calls, sep = ""), sep = "\n", file=stderr())
            cat("\n", file=stderr())
            
            if (!interactive()) {
                q()
            }
        })
        )