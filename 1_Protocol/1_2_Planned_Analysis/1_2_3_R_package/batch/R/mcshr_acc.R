#' Title
#'
#' @param list list
#' @param nc number of core
#' @param Target target
#'
#' @return 结果
#' @export 结果
#'
mcshr_acc <- function(list, nc, Target) {

  # Initialize the parallel backend
  registerDoParallel(nc)

  r_values <- foreach(j = 1:length(list), .packages = c("dplyr", "tidyr")) %dopar% {

    SPE_half_1 <- list[[j]][[1]] %>%
      dplyr::filter(.,Match == "Match") %>%
      dplyr::group_by(Subject,Session,Identity)%>%
      dplyr::summarise(acc = mean(ACC))%>%
      dplyr::ungroup() %>%
      tidyr::pivot_wider(names_from = Identity,
                         values_from = acc) %>%
      dplyr::mutate(acc_SPE = Self - !!sym(Target)) %>%
      dplyr::select(acc_SPE)

    SPE_half_2 <- list[[j]][[2]] %>%
      dplyr::filter(.,Match == "Match") %>%
      dplyr::group_by(Subject,Session,Identity)%>%
      dplyr::summarise(acc = mean(ACC))%>%
      dplyr::ungroup() %>%
      tidyr::pivot_wider(names_from = Identity,
                         values_from = acc) %>%
      dplyr::mutate(acc_SPE = Self - !!sym(Target)) %>%
      dplyr::select(acc_SPE)

    cor(SPE_half_1, SPE_half_2, method = "pearson")
  }

  # Stop the parallel backend
  stopImplicitCluster()

  # Calculate the mean of the Pearson correlation coefficients
  r_values_vector <- unlist(r_values)
  r <- mean(r_values_vector)
  CI <- quantile(r_values_vector, c(0.025, 0.975))

  values <- data.frame("Indece" = "ACC", "r" = r, "LLCI" = CI[1], "ULCI" = CI[2])
  return(values)
}
