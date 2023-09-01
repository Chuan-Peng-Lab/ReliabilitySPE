#' Title
#'
#' @param df 
#' @param i 
#'
#' @return 结果
#' @export 结果

df.ezddm <- function(df,i) {
  result <- df %>%
    # 不关心Nonmatching组的情况，提前筛选掉，提高运行速度
    dplyr::filter(Matching == "Matching") %>%
    ###############################CORE CODES###################################
    hausekeep::fit_ezddm(data = ., rts = "RT_sec", responses = "ACC",
                         id = "Subject", group = c("Session", "Matching", "Identity")) %>%
      ###############################CORE CODES###################################
    dplyr::mutate(z = a / 2,
                  t = t0_Ter) %>%
    dplyr::select(Subject, Session, Matching, Identity, a, t, v, z) %>%
    tidyr::drop_na() %>%
    dplyr::group_by(Identity) %>%
    dplyr::summarise(v_mean = mean(v),
                     v_sd = sd(v),
                     z_mean = mean(z),
                     z_sd = sd(z)) %>%
    dplyr::ungroup() %>%
    dplyr::mutate(Paper_ID = p[[i]])
  
  return(result)
}
