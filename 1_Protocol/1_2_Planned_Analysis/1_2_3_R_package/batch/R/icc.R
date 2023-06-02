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
  result <- switch(indice,
                   "rt" = icc_rt(df, Target),
                   "acc" = icc_acc(df, Target),
                   "dp" = icc_dp(df, Target),
                   "eff" = icc_eff(df, Target),
                   "ddmv" = icc_ddmv(df, Target),
                   "ddmz" = icc_ddmz(df, Target),
                   "rwddm" = icc_rwddm(df, Target),
                   stop("Invalid indice argument")
  )
  return(result)
}
