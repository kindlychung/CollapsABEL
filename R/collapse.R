#' Genotype collapsing functions
#' 
#' See \url{https://gist.github.com/kindlychung/757f816f5b2f9e8d36b8#file-collapse-txt}
#' 
#' @param gen_mat Genotype matrix
#' @param n_shit Shift number.
#' @return A matrix of collapsed genotypes.
collapse = function(gen_mat, n_shift) {
    # Shift the original genotype matrix, compensate the blank parts by NA
    na_cols = matrix(NA, nrow = nrow(gen_mat), ncol = n_shift)
    gen_mat0 = cbind(gen_mat[, (n_shift + 1):ncol(gen_mat)], na_cols)
    # Fix column names
    names(gen_mat0) = names(gen_mat)
    # Calculate collapsed genotypes
    gen_mat00 = gen_mat + gen_mat0
    gen_mat00[gen_mat00 >= 2] = 2
    gen_mat00[gen_mat00 < 2] = 0
    gen_mat00
}

collapse_with_id = function(gen_mat, n_shift=1) {
  res = cbind(gen_mat[, 1:2], collapse(gen_mat[, 3:ncol(gen_mat)], n_shift))
  names(res) = names(gen_mat)
  res
}
