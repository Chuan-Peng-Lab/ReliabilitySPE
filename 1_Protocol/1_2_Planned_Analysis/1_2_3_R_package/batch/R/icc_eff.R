#' Title
#'
#' @param df df
#' @param Target target
#'
#' @return output
#' @export 结果

icc_eff <- function(df, Target) {
  df <- df %>%
    dplyr::group_by(Subject, Identity, Matching, Session) %>%
    dplyr::summarise(Eff = mean(RT_ms)/mean(ACC))%>% # Calculation Formula
    dplyr::ungroup() %>%
    dplyr::filter(Matching == "Matching") %>%
    dplyr::group_by(Subject, Session) %>%
    tidyr::pivot_wider(names_from = Identity,
                       values_from = Eff) %>%
    dplyr::summarise(eff_SPE = Self - !!sym(Target)) %>% #eff of self-match - eff of other-match
    dplyr::ungroup() %>%
    tidyr::spread(key = Session, value = eff_SPE) %>%
    dplyr::select(-Subject)
  return(df)
}
