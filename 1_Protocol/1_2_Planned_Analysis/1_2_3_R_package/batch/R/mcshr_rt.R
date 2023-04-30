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
mcshr_rt <- function(list, nc, Target,
                     Subject = "Subject", Match = "Match", Identity = "Identity", Session = "Session",
                     RT_ms = "RT_ms", ACC = "ACC", Self = "Self") {

  # Initialize the parallel backend
  registerDoParallel(nc)

  r_values <- foreach(j = 1:length(list), .packages = c("dplyr", "tidyr")) %dopar% {

    SPE_half_1 <- list[[j]][[1]] %>%
      dplyr::mutate(Subject = !!sym(Subject), Session = !!sym(Session),
                    Match = !!sym(Match) , Identity = !!sym(Identity), RT_ms = !!sym(RT_ms), ACC = !!sym(ACC)) %>%
      dplyr::filter(., Match == "Match", ACC == "1") %>%
      dplyr::group_by(Subject, Session, Identity) %>%
      dplyr::summarise(mean_rt = mean(RT_ms)) %>%
      dplyr::ungroup() %>%
      tidyr::pivot_wider(names_from = Identity,
                         values_from = mean_rt) %>%
      dplyr::mutate(rt_1_SPE = Self - !!sym(Target)) %>%
      dplyr::select(rt_1_SPE)

    SPE_half_2 <- list[[j]][[2]] %>%
      dplyr::mutate(Subject = !!sym(Subject), Session = !!sym(Session),
                    Match = !!sym(Match) , Identity = !!sym(Identity), RT_ms = !!sym(RT_ms), ACC = !!sym(ACC)) %>%
      dplyr::filter(., Match == "Match", ACC == "1") %>%
      dplyr::group_by(Subject, Session, Identity) %>%
      dplyr::summarise(mean_rt = mean(RT_ms)) %>%
      dplyr::ungroup() %>%
      tidyr::pivot_wider(names_from = Identity,
                         values_from = mean_rt) %>%
      dplyr::mutate(rt_1_SPE = Self - !!sym(Target)) %>%
      dplyr::select(rt_1_SPE)

    cor(SPE_half_1, SPE_half_2, method = "pearson")
  }

  # Stop the parallel backend
  stopImplicitCluster()

  # Calculate the mean of the Pearson correlation coefficients
  r_values_vector <- unlist(r_values)
  r <- mean(r_values_vector)
  CI <- quantile(r_values_vector, c(0.025, 0.975))

  values <- data.frame("Indece" = "RT", "r" = r, "LLCI" = CI[1], "ULCI" = CI[2])
  return(values)
}
