simple = function(a){
  c1 <- contr.treatment(a)
  rownames = 1:a
  colnames = 1:(a-1)
  my.coding <- matrix(rep(1/a, a*(a-1)), ncol = a-1, dimnames = list(rownames, colnames))
  rownames(my.coding) <- 1:a
  colnames(my.coding) <- 1:(a-1)
  my.simple <- c1 - my.coding
  rownames(my.simple) <- 1:a
  colnames(my.simple) <- 1:(a-1)
  print(my.simple)
}

