#' Title
#'
#' @param df 
#' @param i 
#'
#' @return 结果
#' @export 结果

df.rwddm <- function(df,i) {
  result <- df %>%
    # 不关心Nonmatching组的情况，提前筛选掉，提高运行速度
    dplyr::filter(Matching == "Matching") %>%
    # RWiener::wdm 只识别lower upper
    dplyr::mutate(ACC = case_when(ACC == 0 ~ "lower",
                                  ACC == 1 ~ "upper")) %>%
    # RWiener::wdm 一次接受一个被试
    split(.$Subject) %>%
    ###############################CORE CODES###################################
    base::lapply(., yukiBP::rwddm) %>%
    ###############################CORE CODES###################################
    # 将分割的结果重新组合
    base::do.call(rbind, .) %>%
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
