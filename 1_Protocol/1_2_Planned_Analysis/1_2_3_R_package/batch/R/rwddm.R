rwddm <- function(df) {
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
    dplyr::mutate(a = round(alpha, 3),
                  t = round(tau, 3), 
                  z = round(beta, 3), 
                  v = round(delta, 3),
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
}
