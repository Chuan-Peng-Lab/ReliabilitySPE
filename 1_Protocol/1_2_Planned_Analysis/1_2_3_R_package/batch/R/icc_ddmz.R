#' Title
#'
#' @param df df
#' @param Target target
#'
#' @return output
#' @export 结果

icc_ddmz <- function(df, Target) {
  df <- df %>%
    hausekeep::fit_ezddm(data = ., rts = "RT_sec", responses = "ACC", id = "Subject", group = c("Session", "Matching", "Identity")) %>%
    dplyr::mutate(z = a/2) %>%
    dplyr::select(Subject, Session, Matching, Identity, v, z) %>%
    dplyr::select(-v) %>%
    dplyr::filter(Matching == "Matching") %>%
    dplyr::group_by(Subject, Session) %>%
    tidyr::pivot_wider(names_from = Identity,
                       values_from = z) %>%
    dplyr::summarise(z_SPE = Self - !!sym(Target)) %>%
    ungroup() %>%
    tidyr::spread(key = Session, value = z_SPE) %>%
    dplyr::select(-Subject)
  return(df)
}
