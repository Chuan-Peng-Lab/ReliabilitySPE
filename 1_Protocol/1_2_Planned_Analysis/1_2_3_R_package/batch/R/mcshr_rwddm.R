#' Title
#'
#' @param list list
#' @param Target target
#' @param Paper_ID Paper_ID
#'
#' @return 结果
#' @export 结果
#'
mcshr_rwddm <- function(list, Target, Paper_ID) {

  r_values_v <- list()
  r_values_z <- list()

  for(j in 1:length(list)) {

    ################################################################################

    SPE_half_1 <- list[[j]][[1]] %>%
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

    SPE_half_2 <- list[[j]][[2]] %>%
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

    ################################################################################

    SPE_half_1_v <- SPE_half_1 %>%
      dplyr::select(Subject, Session, Matching, Identity, v) %>%
      dplyr::filter(Matching == "Matching") %>%
      tidyr::pivot_wider(names_from = Identity,
                         values_from = v) %>%
      dplyr::mutate(v_SPE_1 = Self - !!sym(Target)) %>%
      dplyr::select(Subject, Session, v_SPE_1)

    SPE_half_2_v <- SPE_half_2 %>%
      dplyr::select(Subject, Session, Matching, Identity, v) %>%
      dplyr::filter(Matching == "Matching") %>%
      tidyr::pivot_wider(names_from = Identity,
                         values_from = v) %>%
      dplyr::mutate(v_SPE_2 = Self - !!sym(Target)) %>%
      dplyr::select(Subject, Session, v_SPE_2)

    df_cor_v <- SPE_half_1_v %>%
      dplyr::left_join(SPE_half_2_v, by = c("Subject", "Session")) %>%
      dplyr::filter(!is.na(v_SPE_1) & !is.na(v_SPE_2)) %>%
      dplyr::filter(is.finite(v_SPE_1) & is.finite(v_SPE_2))

    r_values_v[j] <- cor(df_cor_v[,3], df_cor_v[,4], method = "pearson")

    ################################################################################

    SPE_half_1_z <- SPE_half_1 %>%
      dplyr::select(Subject, Session, Matching, Identity, z) %>%
      dplyr::filter(Matching == "Matching") %>%
      tidyr::pivot_wider(names_from = Identity,
                         values_from = z) %>%
      dplyr::mutate(z_SPE_1 = Self - !!sym(Target)) %>%
      dplyr::select(Subject, Session, z_SPE_1)

    SPE_half_2_z <- SPE_half_2 %>%
      dplyr::select(Subject, Session, Matching, Identity, z) %>%
      dplyr::filter(Matching == "Matching") %>%
      tidyr::pivot_wider(names_from = Identity,
                         values_from = z) %>%
      dplyr::mutate(z_SPE_2 = Self - !!sym(Target)) %>%
      dplyr::select(Subject, Session, z_SPE_2)

    df_cor_z <- SPE_half_1_z %>%
      dplyr::left_join(SPE_half_2_z, by = c("Subject", "Session")) %>%
      dplyr::filter(!is.na(z_SPE_1) & !is.na(z_SPE_2)) %>%
      dplyr::filter(is.finite(z_SPE_1) & is.finite(z_SPE_2))

    r_values_z[j] <- cor(df_cor_z[,3], df_cor_z[,4], method = "pearson")
  }

  # Calculate the mean of the Pearson correlation coefficients
  r_values_vector_v <- unlist(r_values_v)
  r_v <- mean(r_values_vector_v)
  CI_v <- quantile(r_values_vector_v, c(0.025, 0.975))

  r_values_vector_z <- unlist(r_values_z)
  r_z <- mean(r_values_vector_z)
  CI_z <- quantile(r_values_vector_z, c(0.025, 0.975))

  values_v <- data.frame("Indice" = "RWDDM: v", "r" = r_v, "LLCI" = CI_v[1], "ULCI" = CI_v[2], "Target" = Target, "Paper_ID" = Paper_ID)
  values_z <- data.frame("Indice" = "RWDDM: z", "r" = r_z, "LLCI" = CI_z[1], "ULCI" = CI_z[2], "Target" = Target, "Paper_ID" = Paper_ID)
  values <- rbind(values_v, values_z)
  return(values)
}
