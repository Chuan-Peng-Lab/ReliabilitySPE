#' Title
#'
#' @param df df
#' @param Target target
#'
#' @return output
#' @export 结果
#'
icc_acc <- function(df, Target) {
  df <- df %>%
    dplyr::group_by(Subject, Session, Matching, Identity)%>%
    dplyr::summarise(acc = mean(ACC))%>% # Calculation Formula
    dplyr::ungroup() %>%
    dplyr::filter(Matching == "Matching") %>%
    dplyr::group_by(Subject,Session) %>%
    tidyr::pivot_wider(names_from = Identity,
                       values_from = acc) %>%
    dplyr::summarise(acc_SPE = Self - !!sym(Target)) %>%
    dplyr::ungroup() %>%
    tidyr::spread(key = Session, value = acc_SPE) %>%
    dplyr::select(-Subject)
  return(df)
}
