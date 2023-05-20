#' Title
#'
#' @param list list
#' @param Target target
#' @param Paper_ID Paper_ID
#'
#' @return 结果
#' @export 结果
#'
mcshr_dp <- function(list, Target, Paper_ID) {

  r_values <- list()

  for(j in 1:length(list)) {

    SPE_half_1 <- list[[j]][[1]] %>%
      dplyr::group_by(Subject,Session,Identity) %>%
      dplyr::summarise(
        hit = length(ACC[Matching == "Matching" & ACC == 1]),
        fa = length(ACC[Matching == "Nonmatching" & ACC == 0]),
        miss = length(ACC[Matching == "Matching" & ACC == 0]),
        cr = length(ACC[Matching == "Nonmatching" & ACC == 1]),
        Dprime = qnorm(
          ifelse(hit / (hit + miss) < 1,
                 hit / (hit + miss),
                 1 - 1 / (2 * (hit + miss))
          )
        ) - qnorm(
          ifelse(fa / (fa + cr) > 0,
                 fa / (fa + cr),
                 1 / (2 * (fa + cr))
          )
        )) %>%
      dplyr::ungroup() %>%
      select(-"hit",-"fa",-"miss",-"cr") %>%
      tidyr::pivot_wider(names_from = Identity,
                         values_from = Dprime) %>%
      dplyr::mutate(dprime_SPE_1 = Self - !!sym(Target)) %>%
      dplyr::select(Subject, Session, dprime_SPE_1)

    SPE_half_2 <- list[[j]][[2]] %>%
      dplyr::group_by(Subject,Session,Identity) %>%
      dplyr::summarise(
        hit = length(ACC[Matching == "Matching" & ACC == 1]),
        fa = length(ACC[Matching == "Nonmatching" & ACC == 0]),
        miss = length(ACC[Matching == "Matching" & ACC == 0]),
        cr = length(ACC[Matching == "Nonmatching" & ACC == 1]),
        Dprime = qnorm(
          ifelse(hit / (hit + miss) < 1,
                 hit / (hit + miss),
                 1 - 1 / (2 * (hit + miss))
          )
        ) - qnorm(
          ifelse(fa / (fa + cr) > 0,
                 fa / (fa + cr),
                 1 / (2 * (fa + cr))
          )
        )) %>%
      dplyr::ungroup() %>%
      select(-"hit",-"fa",-"miss",-"cr") %>%
      tidyr::pivot_wider(names_from = Identity,
                         values_from = Dprime) %>%
      dplyr::mutate(dprime_SPE_2 = Self - !!sym(Target)) %>%
      dplyr::select(Subject, Session, dprime_SPE_2)

    df.cor <- SPE_half_1 %>%
      dplyr::left_join(SPE_half_2, by = c("Subject", "Session")) %>%
      dplyr::filter(!is.na(dprime_SPE_1) & !is.na(dprime_SPE_2)) %>%
      dplyr::filter(is.finite(dprime_SPE_1) & is.finite(dprime_SPE_2))

    cor(df.cor[,3], df.cor[,4], method = "pearson")

    r_values[j] <- cor(df.cor[,3], df.cor[,4], method = "pearson")
  }

  # Calculate the mean of the Pearson correlation coefficients
  r_values_vector <- unlist(r_values)
  r <- mean(r_values_vector)
  CI <- quantile(r_values_vector, c(0.025, 0.975))

  values <- data.frame("Indice" = "Dprime", "r" = r, "LLCI" = CI[1], "ULCI" = CI[2], "Target" = Target, "Paper_ID" = Paper_ID)
  return(values)
}
