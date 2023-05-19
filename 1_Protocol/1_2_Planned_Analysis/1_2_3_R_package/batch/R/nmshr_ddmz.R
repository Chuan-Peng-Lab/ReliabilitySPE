#' Title
#'
#' @param list list
#' @param Target target
#' @param Paper_ID Paper_ID
#'
#' @return 结果
#' @export 结果
#'
nmshr_ddmz <- function(list, Target, Paper_ID) {
  values <- data.frame(matrix(nrow = length(list), ncol = 3))
  for(j in 1:length(list)) {
    SPE_half_1 <- list[[j]][[1]] %>%
      hausekeep::fit_ezddm(data = ., rts = "RT_sec", responses = "ACC", id = "Subject", group = c("Session", "Matching", "Identity")) %>%
      dplyr::mutate(., z = a/2) %>%
      dplyr::select(Subject, Session, Matching, Identity, z) %>%
      dplyr::filter(Matching == "Matching") %>%
      tidyr::pivot_wider(names_from = Identity,
                         values_from = z) %>%
      dplyr::mutate(z_SPE_1 = Self - !!sym(Target)) %>%
      dplyr::select(Subject, Session, z_SPE_1)

    SPE_half_2 <- list[[j]][[2]] %>%
      hausekeep::fit_ezddm(data = ., rts = "RT_sec", responses = "ACC", id = "Subject", group = c("Session", "Matching", "Identity")) %>%
      dplyr::mutate(., z = a/2) %>%
      dplyr::select(Subject, Session, Matching, Identity, z) %>%
      dplyr::filter(Matching == "Matching") %>%
      tidyr::pivot_wider(names_from = Identity,
                         values_from = z) %>%
      dplyr::mutate(z_SPE_2 = Self - !!sym(Target)) %>%
      dplyr::select(Subject, Session, z_SPE_2)

    df.cor <- SPE_half_1 %>%
    dplyr::left_join(SPE_half_2, by = c("Subject", "Session")) %>%
    dplyr::filter(!is.na(z_SPE_1) & !is.na(z_SPE_2)) %>%
      dplyr::filter(is.finite(z_SPE_1) & is.finite(z_SPE_2))

    r_value <- cor(df.cor[,3], df.cor[,4], method = "pearson")

    values[j,1] <- "ezDDM: z"
    values[j,2] <- j
    values[j,3] <- r_value
    values[j,4] <- Target
    values[j,5] <- Paper_ID
  }
  return(values)
}
