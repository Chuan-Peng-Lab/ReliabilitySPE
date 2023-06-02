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
nmshr <- function(list, indice, Target, Paper_ID) {
  result <- switch(indice,
                   "rt" = nmshr_rt(list, Target, Paper_ID),
                   "acc" = nmshr_acc(list, Target, Paper_ID),
                   "dp" = nmshr_dp(list, Target, Paper_ID),
                   "eff" = nmshr_eff(list, Target, Paper_ID),
                   "ddmv" = nmshr_ddmv(list, Target, Paper_ID),
                   "ddmz" = nmshr_ddmz(list, Target, Paper_ID),
                   "rwddm" = nmshr_rwddm(list, Target, Paper_ID),
                   stop("Invalid indice argument")
  )
  return(result)
}

