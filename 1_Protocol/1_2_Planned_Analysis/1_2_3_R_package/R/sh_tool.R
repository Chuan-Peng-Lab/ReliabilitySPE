#' Title
#'
#' @param df.split data
#' @param iteration iteration
#' @param nc nunmber of cores (only for mc)
#' @param sub Subject
#' @param var1 variable 1
#' @param var2 variable 2
#' @param var3 variable 3
#' @param method split method, "mc", "fs", "od", "permuted"
#'
#' @return 返回分半的结果
#' @export 返回分半的结果

sh_tool <- function(df.split, iteration, nc, sub, var1, var2, var3, method) {
  if (method == "mc") {
    mc(df.split, iteration, nc, sub, var1, var2, var3)
  } else {
    other(df.split, method, sub, var1, var2, var3)
  }
}
