#' Title
#'
#' @param list list
#' @param nc number of core
#' @param indice indice ("rc", "acc", "dp", "eff", "ddmv", "ddmz")
#' @param Target target
#' @param Paper_ID Paper_ID
#'
#' @return 结果
#' @export 结果
#'
mcshr <- function(list, nc, indice, Target, Paper_ID) {
  result <- switch(indice,
                   "rt" = mcshr_rt(list, nc, Target, Paper_ID),
                   "acc" = mcshr_acc(list, nc, Target, Paper_ID),
                   "dp" = mcshr_dp(list, nc, Target, Paper_ID),
                   "eff" = mcshr_eff(list, nc, Target, Paper_ID),
                   "ddmv" = mcshr_ddmv(list, nc, Target, Paper_ID),
                   "ddmz" = mcshr_ddmz(list, nc, Target, Paper_ID),
                   stop("Invalid indice argument")
  )
  return(result)
}

