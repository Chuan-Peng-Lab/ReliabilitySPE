#' Title
#'
#' @param df df
#' @param Target target
#'
#' @return output
#' @export 结果

icc_rt <- function(df, Target) {
  df <- df %>%
    dplyr::filter(ACC == "1") %>%
    dplyr::group_by(Subject, Session, Matching, Identity) %>%
    dplyr::summarise(mean_rt = mean(RT_ms)) %>% # Calculation Formula
    dplyr::ungroup() %>%
    dplyr::filter(Matching == "Matching") %>%
    dplyr::group_by(Subject, Session) %>%
    tidyr::pivot_wider(names_from = Identity,
                       values_from = mean_rt) %>%
    dplyr::summarise(rt_1_SPE = Self - !!sym(Target)) %>%
    dplyr::ungroup() %>%
    tidyr::spread(key = Session, value = rt_1_SPE) %>%
    dplyr::select(-Subject)
  return(df)
}
