#' Title
#'
#' @param list list
#' @param Target target
#'
#' @return 结果
#' @export 结果
#'
nmshr_rt <- function(list, Target) {
  values <- data.frame(matrix(nrow = length(list), ncol = 3))
  for(j in 1:length(list)) {
    SPE_half_1 <- list[[j]][[1]] %>%
      dplyr::filter(.,Match == "Match", ACC == "1") %>%
      dplyr::group_by(Subject, Session, Identity) %>%
      dplyr::summarise(mean_rt = mean(RT_ms)) %>%
      dplyr::ungroup() %>%
      tidyr::pivot_wider(names_from = Identity,
                         values_from = mean_rt) %>%
      dplyr::mutate(rt_1_SPE = Self - !!sym(Target)) %>%
      dplyr::select(rt_1_SPE)

    SPE_half_2 <- list[[j]][[2]] %>%
      dplyr::filter(.,Match == "Match", ACC == "1") %>%
      dplyr::group_by(Subject, Session, Identity) %>%
      dplyr::summarise(mean_rt = mean(RT_ms)) %>%
      dplyr::ungroup() %>%
      tidyr::pivot_wider(names_from = Identity,
                         values_from = mean_rt) %>%
      dplyr::mutate(rt_1_SPE = Self - !!sym(Target)) %>%
      dplyr::select(rt_1_SPE)

    r_value <- cor(SPE_half_1, SPE_half_2, method = "pearson")

    values[j,1] <- "RT"
    values[j,2] <- j
    values[j,3] <- r_value
  }
  return(values)
}
