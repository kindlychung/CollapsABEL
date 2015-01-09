# a function for changing the data format "dd.mm.yyyy" to "yyyy.mm.dd"
cleanDate = function(d) {
  d = gsub("(\\d{2})\\.(\\d{2})\\.(\\d{4})", "\\3.\\2.\\1", d)
  d
}
