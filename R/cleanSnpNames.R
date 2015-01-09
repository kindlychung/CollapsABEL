cleanSnpNames = function(x) {
    x = gsub(":", "AAA", x)
    x = gsub("^(\\d+)", "C\\1", x)
    x
}
