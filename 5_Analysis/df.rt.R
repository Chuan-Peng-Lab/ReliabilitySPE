#' Title
#'
#' @param df 
#' @param i 
#'
#' @return 结果
#' @export 结果

df.rt <- function(df,i) {
  result <- df %>%
    dplyr::filter(., Matching == "Matching") %>%
    dplyr::group_by(Subject, Session, Identity) %>%
    dplyr::summarise(mean_rt = mean(RT_ms)) %>%
    dplyr::ungroup() %>%
    tidyr::drop_na() %>%
    dplyr::group_by(Identity) %>%
    dplyr::summarise(RT_mean = mean(mean_rt),
                     RT_sd = sd(mean_rt)) %>%
    dplyr::ungroup() %>%
    dplyr::mutate(Paper_ID = p[[i]])
  
  return(result)
}
