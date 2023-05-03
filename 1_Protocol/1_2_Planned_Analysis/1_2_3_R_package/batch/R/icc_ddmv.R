#' Title
#'
#' @param df df
#' @param Target target
#'
#' @return output
#' @export 结果

icc_ddmv <- function(df, Target) {
  df <- df %>%
    hausekeep::fit_ezddm(data = ., rts = "RT_sec", responses = "ACC", id = "Subject", group = c("Session", "Matching", "Identity")) %>%
    dplyr::mutate(z = a/v) %>%
    dplyr::select(Subject, Session, Matching, Identity, v, z) %>%
    dplyr::select(-z) %>%
    dplyr::filter(Matching == "Matching") %>%
    dplyr::group_by(Subject, Session) %>%
    tidyr::pivot_wider(names_from = Identity,
                       values_from = v) %>%
    dplyr::summarise(v_SPE = Self - !!sym(Target)) %>%
    ungroup() %>%
    tidyr::spread(key = Session, value = v_SPE) %>%
    dplyr::select(-Subject)
  return(df)
}
