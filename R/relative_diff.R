# calculate relative difference between two vectors
relative_diff = function(x1, x2, sort_first=FALSE) {
  if(sort_first) {
    x1 = sort(x1)
    x2 = sort(x2)
  }
  dat = data.frame(x1=x1, x2=x2)
  dat = mice::cc(dat)
  abs(dat$x1 - dat$x2) / pmax(abs(dat$x2), abs(dat$x1))
}
