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
  result <- switch(indice,
                   "rt" = mcshr_rt(list, nc, Target),
                   "acc" = mcshr_acc(list, nc, Target),
                   "dp" = mcshr_dp(list, nc, Target),
                   "eff" = mcshr_eff(list, nc, Target),
                   "ddmv" = mcshr_ddmv(list, nc, Target),
                   "ddmz" = mcshr_ddmz(list, nc, Target),
                   stop("Invalid indice argument")
  )
  return(result)
}

