setwd("/media/data1/RS123_pheno/")
faceDat = read.table("face.phenoAll.csv", head = T)
zygrDat = faceDat[, grepl("ZygR", colnames(faceDat))]
zyglDat = faceDat[, grepl("ZygL", colnames(faceDat))]
eyerDat = faceDat[, grepl("EyeR", colnames(faceDat))]
eyelDat = faceDat[, grepl("EyeL", colnames(faceDat))]
alrrDat = faceDat[, grepl("AlrR", colnames(faceDat))]
alrlDat = faceDat[, grepl("AlrL", colnames(faceDat))]
nsnDat = faceDat[, grepl("Nsn", colnames(faceDat))]
prnDat = faceDat[, grepl("Prn", colnames(faceDat))]
sbnDat = faceDat[, grepl("Sbn", colnames(faceDat))]
alldat = list(zygr = zygrDat, zygl = zyglDat, eyer = eyerDat, eyel = eyelDat, alrr = alrrDat, alrl = alrlDat, nsn = nsnDat, prn = prnDat, sbn = sbnDat)

idxCombination = combn(1:length(alldat), 2)

calcDist = function(dat1, dat2) {
    sqrt(rowSums((dat1 - dat2)^2))
}

# dat1 = data.frame(1:5, 2:6, 3:7)
# dat1[2, 2] = NA
# dat2 = data.frame(2:6, 3:7, 4:8)
# calcDist(dat1, dat2)

calcDistByIdx = function(idxVec) {
    idx1 = idxVec[1]
    idx2 = idxVec[2]
    dat1 = alldat[[idx1]]
    dat2 = alldat[[idx2]]
    calcDist(dat1, dat2)
}

distDat = apply(idxCombination, 2, calcDistByIdx)
dim(distDat)
head(distDat)
distNames = paste("dist", 1:36, sep = "")
colnames(distDat) = distNames
faceDat = cbind(faceDat, distDat)
head(faceDat)
write.table(faceDat, file = "face.phenoAll.csv", row.names = FALSE, col.names = TRUE, sep="\t", quote=FALSE)
