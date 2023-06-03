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
    # RWiener::wdm 只接受一个分组变量
    split(.$Subject) %>%
    # 执行wdm，然后将分割的结果重新组合
    base::lapply(., function(df) {
      df <- df %>%
        tidyr::unite(group, Subject, Matching, Identity, Session, sep = "_") %>%
        dplyr::mutate(group = factor(group))
      ###############################Core Codes#################################
      temp <- RWiener::wdm(df, xvar = "group", yvar = c("RT_sec", "ACC"))
      ###############################Core Codes#################################
      result <- data.frame(temp$coefficients) %>%
        dplyr::mutate(group = rownames(.)) %>%
        tidyr::separate(group, into = c("Subject", "Matching", "Identity", "Session"), sep = "_") %>%
        tidyr::separate(Session, into = c("Session", "Indice"), sep = ":") %>%
        tidyr::pivot_wider(names_from = Indice,
                           values_from = temp.coefficients) %>%
        dplyr::mutate(a = alpha, t = tau, z = beta, v = delta,
                      Subject = as.numeric(Subject),
                      Matching = factor(Matching,
                                        levels = c("Matching", "Nonmatching")),
                      Identity = factor(Identity,
                                        levels = c("Self", "Friend", "Stranger")),
                      Session = as.character(Session)
        ) %>%
        dplyr::arrange(Subject, Matching, Identity, Session) %>%
        dplyr::select(Subject, Matching, Identity, Session, a, t, z, v)
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
