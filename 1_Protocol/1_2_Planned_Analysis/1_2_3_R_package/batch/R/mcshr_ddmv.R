#' Title
#'
#' @param list list
#' @param nc number of core
#' @param Target target
#' @param Paper_ID Paper_ID
#'
#' @return 结果
#' @export 结果
#'
mcshr_ddmv <- function(list, nc, Target, Paper_ID) {

  # Initialize the parallel backend
  registerDoParallel(nc)

  r_values <- foreach(j = 1:length(list), .packages = c("dplyr", "tidyr", "hausekeep")) %dopar% {

    SPE_half_1 <- list[[j]][[1]] %>%
      hausekeep::fit_ezddm(data = ., rts = "RT_sec", responses = "ACC", id = "Subject", group = c("Session", "Matching", "Identity")) %>%
      dplyr::select(Subject, Session, Matching, Identity, v) %>%
      dplyr::filter(Matching == "Matching") %>%
      tidyr::pivot_wider(names_from = Identity,
                         values_from = v) %>%
      dplyr::mutate(v_SPE_1 = Self - !!sym(Target)) %>%
      dplyr::select(Subject, Session, v_SPE_1)

    SPE_half_2 <- list[[j]][[2]] %>%
      hausekeep::fit_ezddm(data = ., rts = "RT_sec", responses = "ACC", id = "Subject", group = c("Session", "Matching", "Identity")) %>%
      dplyr::select(Subject, Session, Matching, Identity, v) %>%
      dplyr::filter(Matching == "Matching") %>%
      tidyr::pivot_wider(names_from = Identity,
                         values_from = v) %>%
      dplyr::mutate(v_SPE_2 = Self - !!sym(Target)) %>%
      dplyr::select(Subject, Session, v_SPE_2)

    df.cor <- SPE_half_1 %>%
      dplyr::left_join(SPE_half_2, by = c("Subject", "Session")) %>%
      dplyr::filter(!is.na(v_SPE_1) & !is.na(v_SPE_2)) %>%
      dplyr::filter(is.finite(v_SPE_1) & is.finite(v_SPE_2))

    cor(df.cor[,3], df.cor[,4], method = "pearson")
  }

  # Stop the parallel backend
  stopImplicitCluster()

  # Calculate the mean of the Pearson correlation coefficients
  r_values_vector <- unlist(r_values)
  r <- mean(r_values_vector)
  CI <- quantile(r_values_vector, c(0.025, 0.975))

  values <- data.frame("Indice" = "ezDDM: v", "r" = r, "LLCI" = CI[1], "ULCI" = CI[2], "Target" = Target, "Paper_ID" = Paper_ID)
  return(values)
}
