#' Title
#'
#' @param list list
#' @param indice indices
#' @param Target target
#'
#' @return 结果
#' @export 结果
#'
shr <- function(list, indice, Target) {
  result <- switch(indice,
                   "rt" = shr_rt(list, Target),
                   "acc" = shr_acc(list, Target),
                   "dp" = shr_dp(list, Target),
                   "eff" = shr_eff(list, Target),
                   "ddmv" = shr_ddmv(list, Target),
                   "ddmz" = shr_ddmz(list, Target),
                   stop("Invalid indice argument")
  )
  return(result)
}

