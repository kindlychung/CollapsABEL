appendEnv = function(e1, e2) {
    e1name = deparse(substitute(e1))
    e2name = deparse(substitute(e2))
    listE1 = ls(e1)
    listE2 = ls(e2)
    for(v in listE2) {
        if(v %in% listE1) warning(sprintf("Variable %s is in e1, too!", v))
        e1[[v]] = e2[[v]]
    }
}
