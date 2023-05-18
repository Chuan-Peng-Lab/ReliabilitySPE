#' Title
#'
#' @param list list
#' @param Target target
#' @param Paper_ID Paper_ID
#'
#' @return 结果
#' @export 结果
#'
nmshr_acc <- function(list, Target, Paper_ID) {
  values <- data.frame(matrix(nrow = length(list), ncol = 3))
  for(j in 1:length(list)) {
    SPE_half_1 <- list[[j]][[1]] %>%
      dplyr::filter(.,Matching == "Matching") %>%
      dplyr::group_by(Subject,Session,Identity)%>%
      dplyr::summarise(acc = mean(ACC))%>%
      dplyr::ungroup() %>%
      tidyr::pivot_wider(names_from = Identity,
                         values_from = acc) %>%
      dplyr::mutate(acc_SPE_1 = Self - !!sym(Target)) %>%
      dplyr::select(Subject, Session, acc_SPE_1)

    SPE_half_2 <- list[[j]][[2]] %>%
      dplyr::filter(.,Matching == "Matching") %>%
      dplyr::group_by(Subject,Session,Identity)%>%
      dplyr::summarise(acc = mean(ACC))%>%
      dplyr::ungroup() %>%
      tidyr::pivot_wider(names_from = Identity,
                         values_from = acc) %>%
      dplyr::mutate(acc_SPE_2 = Self - !!sym(Target)) %>%
      dplyr::select(Subject, Session, acc_SPE_2)

    df.cor <- SPE_half_1 %>%
      dplyr::left_join(SPE_half_2, by = c("Subject", "Session")) %>%
      dplyr::filter(!is.na(acc_SPE_1) & !is.na(acc_SPE_2)) %>%
      dplyr::filter(is.finite(acc_SPE_1) & is.finite(acc_SPE_2))

    r_value <- cor(df.cor[,3], df.cor[,4], method = "pearson")

    values[j,1] <- "ACC"
    values[j,2] <- j
    values[j,3] <- r_value
    values[j,4] <- Target
    values[j,5] <- Paper_ID
  }
  return(values)
}
