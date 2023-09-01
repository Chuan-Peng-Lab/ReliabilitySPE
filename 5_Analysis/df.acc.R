#' Title
#'
#' @param df 
#' @param i 
#'
#' @return 结果
#' @export 结果

df.acc <- function(df,i) {
  result <- df %>%
    dplyr::filter(., Matching == "Matching") %>%
    dplyr::group_by(Subject, Session, Identity) %>%
    dplyr::summarise(acc = mean(ACC)) %>%
    dplyr::ungroup() %>%
    tidyr::drop_na() %>%
    dplyr::group_by(Identity) %>%
    dplyr::summarise(ACC_mean = mean(acc),
                     ACC_sd = sd(acc)) %>%
    dplyr::ungroup() %>%
    dplyr::mutate(Paper_ID = p[[i]])
  
  return(result)
}
