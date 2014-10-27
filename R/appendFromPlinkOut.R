appendFromPlinkOut = function(hub, plinkOutFile) {
    coln = getNshiftStr(plinkOutFile)
    datshift = readplinkoutr(plinkOutFile)
    hub$chr = cbind(hub$chr, datshift$CHR)
    hub$snp = cbind(hub$chr, datshift$SNP)
    hub$bp = cbind(hub$chr, datshift$BP)
    hub$pvals = cbind(hub$chr, datshift$P)
    colnames(hub$chr)[ncol(hub$chr)] =
    colnames(hub$snp)[ncol(hub$snp)] =
    colnames(hub$bp)[ncol(hub$bp)] =
    colnames(hub$pvals)[ncol(hub$pvals)] = coln

    invisible(NULL)
}
