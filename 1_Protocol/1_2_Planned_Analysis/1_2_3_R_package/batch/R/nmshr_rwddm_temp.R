#' Title
#'
#' @param list list
#' @param Target target
#' @param Paper_ID Paper_ID
#'
#' @return 结果
#' @export 结果
#'
nmshr_rwddm <- function(list, Target, Paper_ID) {
  values <- data.frame()
  for(j in 1:length(list)) {

################################################################################

    RW_list_1 <- split(shl_test[[j]][[1]], shl_test[[j]][[1]]$Subject)
    result1 <- list()
    for(i in 1:length(RW_list_1)) {
      RW_list_1[[i]] <- RW_list_1[[i]] %>%
        # RWiener::wdm 只识别lower upper
        dplyr::mutate(ACC = case_when(ACC == 0 ~ "lower",
                                      ACC == 1 ~ "upper"))
      result1[[i]] <- rwddm(df = RW_list_1[[i]])
    }
    SPE_half_1 <- base::do.call(rbind, result1)


    RW_list_2 <- split(shl_test[[j]][[1]], shl_test[[j]][[1]]$Subject)
    result2 <- list()
    for(i in 1:length(RW_list_2)) {
      RW_list_2[[i]] <- RW_list_2[[i]] %>%
        # RWiener::wdm 只识别lower upper
        dplyr::mutate(ACC = case_when(ACC == 0 ~ "lower",
                                      ACC == 1 ~ "upper"))
      result2[[i]] <- rwddm(df = RW_list_2[[i]])
    }
    SPE_half_2 <- base::do.call(rbind, result2)

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

    r_value_v <- cor(df_cor_v[,3], df_cor_v[,4], method = "pearson")

    values[j,1] <- "RW: v"
    values[j,2] <- j
    values[j,3] <- r_value_v[1]
    values[j,4] <- Target
    values[j,5] <- Paper_ID

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

    r_value_z <- cor(df_cor_z[,3], df_cor_z[,4], method = "pearson")

    values[j+length(list),1] <- "RW: z"
    values[j+length(list),2] <- j
    values[j+length(list),3] <- r_value_z[1]
    values[j+length(list),4] <- Target
    values[j+length(list),5] <- Paper_ID

################################################################################

  }
  colnames(values) <- c("X1", "X2", "X3", "V4", "V5")
  return(values)
}
