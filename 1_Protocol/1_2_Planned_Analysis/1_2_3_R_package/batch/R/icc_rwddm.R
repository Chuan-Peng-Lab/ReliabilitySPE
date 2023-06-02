#' Title
#'
#' @param df df
#' @param Target target
#'
#' @return output
#' @export 结果

icc_rwddm <- function(df, Target) {
  df <- df %>%
    # RWiener::wdm 只识别lower upper
    dplyr::mutate(ACC = case_when(ACC == 0 ~ "lower",
                                  ACC == 1 ~ "upper")) %>%
    # wdm每次只接受一个实验条件
    dplyr::group_by(Subject, Matching, Identity, Session) %>%
    dplyr::group_split() %>%
    # 执行wdm，然后将分割的结果重新组合
    base::lapply(., function(df) {
      #############################Core Codes#################################
      temp <- RWiener::wdm(df, yvar = c("RT_sec", "ACC"))
      #############################Core Codes#################################
      result <- data.frame(df$Subject[1], df$Matching[1], df$Identity[1], df$Session[1],
                           temp$coefficients[1], temp$coefficients[2], temp$coefficients[3], temp$coefficients[4])
      colnames(result) <- c("Subject", "Matching", "Identity", "Session",
                            "a", "t", "z", "v")
      rownames(result) <- NULL
      return(result)
    }) %>%
    base::do.call(rbind, .)

  df_v <- df %>%
    dplyr::select(Subject, Session, Matching, Identity, v) %>%
    dplyr::filter(Matching == "Matching") %>%
    dplyr::group_by(Subject, Session) %>%
    tidyr::pivot_wider(names_from = Identity,
                       values_from = v) %>%
    dplyr::summarise(v_SPE = Self - !!sym(Target)) %>%
    dplyr::ungroup() %>%
    tidyr::spread(key = Session, value = v_SPE) %>%
    dplyr::select(-Subject)

  df_z <- df %>%
    dplyr::select(Subject, Session, Matching, Identity, z) %>%
    dplyr::filter(Matching == "Matching") %>%
    dplyr::group_by(Subject, Session) %>%
    tidyr::pivot_wider(names_from = Identity,
                       values_from = z) %>%
    dplyr::summarise(z_SPE = Self - !!sym(Target)) %>%
    dplyr::ungroup() %>%
    tidyr::spread(key = Session, value = z_SPE) %>%
    dplyr::select(-Subject)

  df_vz <- list(df_v, df_z)

  return(df_vz)
}
