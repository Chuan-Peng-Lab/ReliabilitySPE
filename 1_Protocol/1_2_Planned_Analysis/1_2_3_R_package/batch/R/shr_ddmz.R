#' Title
#'
#' @param list list
#' @param nc number of core
#' @param Target target
#' @param Subject subject id
#' @param Match match
#' @param Identity identity
#' @param Session session
#' @param RT_ms rt
#' @param ACC acc
#' @param Self self
#'
#' @return 结果
#' @export 结果
#'
shr_ddmz <- function(list, nc, Target,
                     Subject = "Subject", Match = "Match", Identity = "Identity", Session = "Session",
                     RT_ms = "RT_ms", ACC = "ACC", Self = "Self") {
  values <- data.frame(matrix(nrow = length(list), ncol = 3))
  for(j in 1:length(list)) {
    SPE_half_1 <- list[[j]][[1]] %>%
      dplyr::mutate(Subject = !!sym(Subject), Session = !!sym(Session),
                    Match = !!sym(Match) , Identity = !!sym(Identity), RT_ms = !!sym(RT_ms), ACC = !!sym(ACC)) %>%
      hausekeep::fit_ezddm(data = ., rts = "RT_sec", responses = "ACC", id = "Subject", group = c("Session", "Match", "Identity")) %>%
      dplyr::mutate(., z = a/v) %>%
      dplyr::select(Subject, Session, Match, Identity, z) %>%
      dplyr::filter(Match == "Match") %>%
      tidyr::pivot_wider(names_from = Identity,
                         values_from = z) %>%
      dplyr::mutate(z_SPE = Self - !!sym(Target)) %>%
      dplyr::select(z_SPE)

    SPE_half_2 <- list[[j]][[2]] %>%
      dplyr::mutate(Subject = !!sym(Subject), Session = !!sym(Session),
                    Match = !!sym(Match) , Identity = !!sym(Identity), RT_ms = !!sym(RT_ms), ACC = !!sym(ACC)) %>%
      hausekeep::fit_ezddm(data = ., rts = "RT_sec", responses = "ACC", id = "Subject", group = c("Session", "Match", "Identity")) %>%
      dplyr::mutate(., z = a/v) %>%
      dplyr::select(Subject, Session, Match, Identity, z) %>%
      dplyr::filter(Match == "Match") %>%
      tidyr::pivot_wider(names_from = Identity,
                         values_from = z) %>%
      dplyr::mutate(z_SPE = Self - !!sym(Target)) %>%
      dplyr::select(z_SPE)

    r_value <- cor(SPE_half_1, SPE_half_2, method = "pearson")

    values[j,1] <- "ezDDM: z"
    values[j,2] <- j
    values[j,3] <- r_value
  }
  return(values)
}
