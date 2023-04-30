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
mcshr_ddmv <- function(list, nc, Target,
                       Subject = "Subject", Match = "Match", Identity = "Identity", Session = "Session",
                       RT_ms = "RT_ms", ACC = "ACC", Self = "Self") {

  # Initialize the parallel backend
  registerDoParallel(nc)

  r_values <- foreach(j = 1:length(list), .packages = c("dplyr", "tidyr", "hausekeep")) %dopar% {

    SPE_half_1 <- list[[j]][[1]] %>%
      dplyr::mutate(Subject = !!sym(Subject), Session = !!sym(Session),
                    Match = !!sym(Match) , Identity = !!sym(Identity), RT_ms = !!sym(RT_ms), ACC = !!sym(ACC)) %>%
      hausekeep::fit_ezddm(data = ., rts = "RT_sec", responses = "ACC", id = "Subject", group = c("Session", "Match", "Identity")) %>%
      dplyr::select(Subject, Session, Match, Identity, v) %>%
      dplyr::filter(Match == "Match") %>%
      tidyr::pivot_wider(names_from = Identity,
                         values_from = v) %>%
      dplyr::mutate(v_SPE = Self - !!sym(Target)) %>%
      dplyr::select(v_SPE)

    SPE_half_2 <- list[[j]][[2]] %>%
      dplyr::mutate(Subject = !!sym(Subject), Session = !!sym(Session),
                    Match = !!sym(Match) , Identity = !!sym(Identity), RT_ms = !!sym(RT_ms), ACC = !!sym(ACC)) %>%
      hausekeep::fit_ezddm(data = ., rts = "RT_sec", responses = "ACC", id = "Subject", group = c("Session", "Match", "Identity")) %>%
      dplyr::select(Subject, Session, Match, Identity, v) %>%
      dplyr::filter(Match == "Match") %>%
      tidyr::pivot_wider(names_from = Identity,
                         values_from = v) %>%
      dplyr::mutate(v_SPE = Self - !!sym(Target)) %>%
      dplyr::select(v_SPE)

    cor(SPE_half_1, SPE_half_2, method = "pearson")
  }

  # Stop the parallel backend
  stopImplicitCluster()

  # Calculate the mean of the Pearson correlation coefficients
  r_values_vector <- unlist(r_values)
  r <- mean(r_values_vector)
  CI <- quantile(r_values_vector, c(0.025, 0.975))

  values <- data.frame("Indece" = "ezDDM: v", "r" = r, "LLCI" = CI[1], "ULCI" = CI[2])
  return(values)
}
