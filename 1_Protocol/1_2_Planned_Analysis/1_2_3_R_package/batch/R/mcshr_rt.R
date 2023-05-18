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
mcshr_rt <- function(list, nc, Target, Paper_ID) {

  # Initialize the parallel backend
  registerDoParallel(nc)

  r_values <- foreach(j = 1:length(list), .packages = c("dplyr", "tidyr")) %dopar% {

    SPE_half_1 <- list[[j]][[1]] %>%
      dplyr::filter(., Matching == "Matching", ACC == "1") %>%
      dplyr::group_by(Subject, Session, Identity) %>%
      dplyr::summarise(mean_rt = mean(RT_ms)) %>%
      dplyr::ungroup() %>%
      tidyr::pivot_wider(names_from = Identity,
                         values_from = mean_rt) %>%
      dplyr::mutate(rt_1_SPE_1 = Self - !!sym(Target)) %>%
      dplyr::select(Subject, Session, rt_1_SPE_1)

    SPE_half_2 <- list[[j]][[2]] %>%
      dplyr::filter(., Matching == "Matching", ACC == "1") %>%
      dplyr::group_by(Subject, Session, Identity) %>%
      dplyr::summarise(mean_rt = mean(RT_ms)) %>%
      dplyr::ungroup() %>%
      tidyr::pivot_wider(names_from = Identity,
                         values_from = mean_rt) %>%
      dplyr::mutate(rt_1_SPE_2 = Self - !!sym(Target)) %>%
      dplyr::select(Subject, Session, rt_1_SPE_2)

    df.cor <- SPE_half_1 %>%
      dplyr::left_join(SPE_half_2, by = c("Subject", "Session")) %>%
      dplyr::filter(!is.na(rt_1_SPE_1) & !is.na(rt_1_SPE_2)) %>%
      dplyr::filter(is.finite(rt_1_SPE_1) & is.finite(rt_1_SPE_2))

    cor(df.cor[,3], df.cor[,4], method = "pearson")
  }

  # Stop the parallel backend
  stopImplicitCluster()

  # Calculate the mean of the Pearson correlation coefficients
  r_values_vector <- unlist(r_values)
  r <- mean(r_values_vector)
  CI <- quantile(r_values_vector, c(0.025, 0.975))

  values <- data.frame("Indice" = "RT", "r" = r, "LLCI" = CI[1], "ULCI" = CI[2], "Target" = Target, "Paper_ID" = Paper_ID)
  return(values)
}
