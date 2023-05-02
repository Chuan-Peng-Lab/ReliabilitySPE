#' Title
#'
#' @param df df
#' @param indice indice ("rc", "acc", "dp", "eff", "ddmv", "ddmz")
#' @param Target target
#'
#' @return 结果
#' @export 结果
#'
icc <- function(df, indice, Target) {
  if (indice == "rt") {
    result <- icc_rt(df, Target)
  } else if (indice == "acc") {
    result <- icc_acc(df, Target)
  } else if (indice == "dp") {
    result <- icc_dp(df, Target)
  } else if (indice == "eff") {
    result <- icc_eff(df, Target)
  } else if (indice == "ddmv") {
    result <- icc_ddmv(df, Target)
  } else if (indice == "ddmz") {
    result <- icc_ddmz(df, Target)
  } else {
    stop("Invalid indice argument")
  }
  return(result)
}
