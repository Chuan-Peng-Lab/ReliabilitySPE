#' Title
#'
#' @param df df
#' @param Target target
#'
#' @return output
#' @export 结果

icc_dp <- function(df, Target) {
  df <- df %>%
    dplyr::group_by(Subject,Session,Identity) %>%
    dplyr::summarise(hit = length(ACC[Matching == "Matching" & ACC == 1]),
                     fa = length(ACC[Matching == "Nonmatching" & ACC == 0]),
                     miss = length(ACC[Matching == "Matching" & ACC == 0]),
                     cr = length(ACC[Matching == "Nonmatching" & ACC == 1]),
                     Dprime = qnorm(
                       ifelse(hit / (hit + miss) < 1,
                              hit / (hit + miss),
                              1 - 1 / (2 * (hit + miss))
                       )
                     ) - qnorm(
                       ifelse(fa / (fa + cr) > 0,
                              fa / (fa + cr),
                              1 / (2 * (fa + cr))
                       )
                     )
    ) %>% # Calculation Formula
    dplyr::select(-"hit",-"fa",-"miss",-"cr") %>%
    dplyr::group_by(Subject, Session)  %>%
    tidyr::pivot_wider(names_from = Identity,
                       values_from = Dprime) %>%
    dplyr::summarise(dprime_SPE = Self - !!sym(Target)) %>%
    dplyr::ungroup() %>%
    tidyr::spread(key = Session, value = dprime_SPE) %>%
    dplyr::select(-Subject)
  return(df)
}
