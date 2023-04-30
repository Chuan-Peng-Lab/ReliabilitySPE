#' Title
#'
#' @param list list
#' @param nc number of core
#' @param indice indice ("rc", "acc", "dp", "eff", "ddmv", "ddmz")
#' @param Target target
#'
#' @return 结果
#' @export 结果
#'
mcshr <- function(list, nc, indice, Target) {
  if (indice == "rt") {
    result <- mcshr_rt(list, nc, Target)
  } else if (indice == "acc") {
    result <- mcshr_acc(list, nc, Target)
  } else if (indice == "dp") {
    result <- mcshr_dp(list, nc, Target)
  } else if (indice == "eff") {
    result <- mcshr_eff(list, nc, Target)
  } else if (indice == "ddmv") {
    result <- mcshr_ddmv(list, nc, Target)
  } else if (indice == "ddmz") {
    result <- mcshr_ddmz(list, nc, Target)
  } else {
    stop("Invalid indice argument")
  }
  return(result)
}
