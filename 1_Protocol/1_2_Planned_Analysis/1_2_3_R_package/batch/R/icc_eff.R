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

icc_eff <- function(df, Target,
                    Subject = "Subject", Match = "Match", Identity = "Identity", Session = "Session",
                    RT_ms = "RT_ms", ACC = "ACC", Self = "Self") {
  df <- df %>%
    dplyr::mutate(Subject = !!sym(Subject), Session = !!sym(Session),
                  Match = !!sym(Match) , Identity = !!sym(Identity), RT_ms = !!sym(RT_ms), ACC = !!sym(ACC)) %>%
    dplyr::group_by(Subject, Identity, Match, Session) %>%
    dplyr::summarise(Eff = mean(RT_ms)/mean(ACC))%>% # Calculation Formula
    dplyr::ungroup() %>%
    dplyr::filter(Match == "Match") %>%
    dplyr::group_by(Subject, Session) %>%
    tidyr::pivot_wider(names_from = Identity,
                       values_from = Eff) %>%
    dplyr::summarise(eff_SPE = Self - !!sym(Target)) %>% #eff of self-match - eff of other-match
    dplyr::ungroup() %>%
    tidyr::spread(key = Session, value = eff_SPE) %>%
    dplyr::select(-Subject)
  return(df)
}
