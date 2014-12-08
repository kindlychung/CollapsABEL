#####################################
## practical 1
#####################################
pbc = read.table("/tmp/pbc.dat", head=T)
head(pbc)
summary(pbc$age)
pbc$age = pbc$age / 365
pbc$year = pbc$day / 365
pbc$years =  pbc$days / 365
summary(pbc$status)
hist(pbc$status)
pbc$status2 = (pbc$status >= 1) + 0
hist(pbc$status2)
pbc$status2 = factor(x = pbc$status2, labels = c("alive", "dead"))
pbc$sex = factor(x = pbc$sex, labels = c("male", "female"))
hist(pbc$edema)
pbc$edema = factor(x = pbc$edema, labels = c("no edema", "edema no diuretics", "edema despite diuretics"))
summarise(group_by(pbc, status2), mean = mean(serBilir), sd = sd(serBilir))
require(ggplot2)
p = ggplot(pbc, aes(year, serBilir)) + geom_point()
print(p)
t1 = table(pbc$sex, pbc$status2)
t2 = matrix(NA, 2, 2)
for(i in 1:ncol(t1)) {
    t2[, i] = t1[, i] / sum(t1[, i])
}
t1
t2
chisq.test(t1)
fisher.test(t1)
p = ggplot(pbc, aes(status2, serBilir)) + geom_boxplot()
print(p)

#####################################
## practical 2
#####################################
data("aids.id", package="JM")
head(aids.id)
res = t.test(CD4 ~ drug, data=aids.id)
str(res)
res$p.value
res$estimate[1]
res$conf.int[2]
res = as.list(res)
lapply(res, print)
report_dat = data.frame(
    mean1 = res$estimate[1], 
    mean2 = res$estimate[2],
    low = res$conf.int[1],
    up = res$conf.int[2],
    p = res$p.value
    )
mutate(report_dat, 
    diff = mean1 - mean2
       )
