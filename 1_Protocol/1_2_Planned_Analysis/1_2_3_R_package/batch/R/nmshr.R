#' Title
#'
#' @param list list
#' @param indice indice ("rc", "acc", "dp", "eff", "ddmv", "ddmz")
#' @param Target target
#'
#' @return 结果
#' @export 结果
#'
nmshr <- function(list, indice, Target) {
  result <- switch(indice,
                   "rt" = nmshr_rt(list, Target),
                   "acc" = nmshr_acc(list, Target),
                   "dp" = nmshr_dp(list, Target),
                   "eff" = nmshr_eff(list, Target),
                   "ddmv" = nmshr_ddmv(list, Target),
                   "ddmz" = nmshr_ddmz(list, Target),
                   stop("Invalid indice argument")
  )
  return(result)
}

