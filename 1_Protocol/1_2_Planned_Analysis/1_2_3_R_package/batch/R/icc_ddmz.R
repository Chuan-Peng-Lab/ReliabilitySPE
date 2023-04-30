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

icc_ddmz <- function(df, Target,
                     Subject = "Subject", Match = "Match", Identity = "Identity", Session = "Session",
                     RT_ms = "RT_ms", ACC = "ACC", Self = "Self") {
  df <- df %>%
    hausekeep::fit_ezddm(data = ., rts = "RT_sec", responses = "ACC", id = "Subject", group = c("Session", "Match", "Identity")) %>%
    dplyr::mutate(z = a/v) %>%
    dplyr::select(Subject, Session, Match, Identity, v, z) %>%
    dplyr::select(-v) %>%
    dplyr::filter(Match == "Match") %>%
    dplyr::group_by(Subject, Session) %>%
    tidyr::pivot_wider(names_from = Identity,
                       values_from = z) %>%
    dplyr::summarise(z_SPE = Self - !!sym(Target)) %>%
    ungroup() %>%
    tidyr::spread(key = Session, value = z_SPE) %>%
    dplyr::select(-Subject)
  return(df)
}
