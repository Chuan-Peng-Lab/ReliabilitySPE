#' Title
#'
#' @param df df
#' @param Target target
#' @param Subject subject id
#' @param Match match
#' @param Identity identity
#' @param Session session
#' @param RT_ms rt
#' @param ACC acc
#' @param Self self
#'
#' @return output
#' @export 结果

icc_dp <- function(df, Target,
                   Subject = "Subject", Match = "Match", Identity = "Identity", Session = "Session",
                   RT_ms = "RT_ms", ACC = "ACC", Self = "Self") {
  df <- df %>%
    dplyr::mutate(Subject = !!sym(Subject), Session = !!sym(Session),
                  Match = !!sym(Match) , Identity = !!sym(Identity), RT_ms = !!sym(RT_ms), ACC = !!sym(ACC)) %>%
    dplyr::group_by(Subject,Session,Identity) %>%
    dplyr::summarise(hit = length(ACC[Match == "Match" & ACC == 1]),
                     fa = length(ACC[Match == "Nonmatch" & ACC == 0]),
                     miss = length(ACC[Match == "Match" & ACC == 0]),
                     cr = length(ACC[Match == "Nonmatch" & ACC == 1]),
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
