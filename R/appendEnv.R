#' Merge two enviroments
#' 
#' Merge two enviroments. If these two environments have some object with identical name \code{o}, then
#' \code{o} in the first environment with be overwritten by \code{o} in the second environment. The first 
#' environment is updated in-place, no third environment is generated.
#' 
#' @param e1 First environment
#' @param e2 Second environment
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
