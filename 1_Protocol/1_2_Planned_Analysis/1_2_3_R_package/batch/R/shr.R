#' Title
#'
#' @param list list
#' @param indice indice ("rc", "acc", "dp", "eff", "ddmv", "ddmz")
#' @param Target target
#' @param Paper_ID Paper_ID
#' @param mc Monte Carlo or not
#' @param nc number of core

#' @return 结果
#' @export 结果
#'
shr <- function(list, indice, Target, Paper_ID, mc = FALSE, nc = NULL) {
  if (mc) {
    result <- mcshr(list, nc, indice, Target, Paper_ID)
  } else {
    result <- nmshr(list, indice, Target, Paper_ID)
  }
  return(result)
}
