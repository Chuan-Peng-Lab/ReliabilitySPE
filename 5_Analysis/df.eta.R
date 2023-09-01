#' Title
#'
#' @param df 
#' @param i 
#'
#' @return 结果
#' @export 结果

df.eta <- function(df,i) {
  result <- df %>%
    dplyr::filter(., Matching == "Matching") %>%
    dplyr::group_by(Subject, Identity, Session) %>%
    dplyr::summarise(Eff = mean(RT_ms)/mean(ACC))%>%
    dplyr::ungroup() %>%
    tidyr::drop_na() %>%
    dplyr::group_by(Identity) %>%
    dplyr::summarise(eta_mean = mean(Eff),
                     eta_sd = sd(Eff)) %>%
    dplyr::ungroup() %>%
    dplyr::mutate(Paper_ID = p[[i]])
  
  return(result)
}
