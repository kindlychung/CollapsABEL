appendFromPlinkOut = function(hub, plinkOutFile) {
    coln = getNshiftStr(plinkOutFile)
    datshift = readplinkoutr(plinkOutFile)
    hub$chr = cbind(hub$chr, datshift$CHR)
    hub$snp = cbind(hub$snp, datshift$SNP)
    hub$bp = cbind(hub$bp, datshift$BP)
    hub$pvals = cbind(hub$pvals, datshift$P)
    colnames(hub$chr)[ncol(hub$chr)] =
    colnames(hub$snp)[ncol(hub$snp)] =
    colnames(hub$bp)[ncol(hub$bp)] =
    colnames(hub$pvals)[ncol(hub$pvals)] = coln

    invisible(NULL)
}
