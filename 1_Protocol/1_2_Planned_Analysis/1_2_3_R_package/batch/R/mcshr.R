#' Title
#'
#' @param list list
#' @param indice indice ("rc", "acc", "dp", "eff", "ddmv", "ddmz", "rwddm")
#' @param Target target
#' @param Paper_ID Paper_ID
#'
#' @return 结果
#' @export 结果
#'
mcshr <- function(list, indice, Target, Paper_ID) {
  result <- switch(indice,
                   "rt" = mcshr_rt(list, Target, Paper_ID),
                   "acc" = mcshr_acc(list, Target, Paper_ID),
                   "dp" = mcshr_dp(list, Target, Paper_ID),
                   "eff" = mcshr_eff(list, Target, Paper_ID),
                   "ddmv" = mcshr_ddmv(list, Target, Paper_ID),
                   "ddmz" = mcshr_ddmz(list, Target, Paper_ID),
                   "rwddm" = mcshr_rwddm(list, Target, Paper_ID),
                   stop("Invalid indice argument")
  )
  return(result)
}

