#' Title
#'
#' @param df.split 被分半的list
#' @param iteration 迭代次数
#' @param nc 使用的CPU线程数
#' @param sub 被试是哪一列
#' @param var1 第一个自变量
#' @param var2 第二个自变量
#' @param var3 第三个自变量
#'
#' @return 返回蒙特卡洛分半的结果
#' @export 返回蒙特卡洛分半的结果

mc <- function(df.split, iteration, nc, sub, var1, var2, var3) {
  # Scientific notation
  options(scipen = 999)

  # Convert data.frame to data.table
  setDT(df.split)

  # Stratify the data by Match and Identity
  split_data <- split(df.split, list(df.split[[sub]], df.split[[var1]],
                                     df.split[[var2]], df.split[[var3]]))

  # Initialize a vector to store the Pearson correlation coefficients
  split_list <- vector("list", iteration)

  # Initialize the parallel backend
  registerDoParallel(nc)

  # declare j variable
  j <- 0

  # Run the for loop in parallel
  split_list <- foreach(j = 1:iteration, .combine = "c") %dopar% {
    set.seed(122+j)
    # Initialize empty lists to store the split-half data sets
    str_half_split_1 <- list()
    str_half_split_2 <- list()

    # Calculate the split-half reliability for each group
    str_half_split <- lapply(split_data, function(x) {

      # Remove rows with missing values
      data <- x[complete.cases(x),]

      # Permute the rows of the data and split it into two halves
      permuted_data <- data[sample(nrow(data)),]
      half_split_1 <- permuted_data[1:floor(nrow(permuted_data)/2),]
      half_split_2 <- permuted_data[(floor(nrow(permuted_data)/2)+1):nrow(permuted_data),]

      # Get the minimum number of rows between the two data sets
      min_rows <- min(nrow(half_split_1), nrow(half_split_2))

      # Subset both data sets to use the same number of rows
      half_split_1 <- half_split_1[1:min_rows,]
      half_split_2 <- half_split_2[1:min_rows,]

      # Return the split-half data sets
      return(list(half_split_1, half_split_2))
    })

    # Combine the split-half data sets from all groups
    str_half_split_1 <- do.call(rbind, lapply(str_half_split, "[[", 1))
    str_half_split_2 <- do.call(rbind, lapply(str_half_split, "[[", 2))

    # Return the split-half data sets
    return(list(str_half_split_1, str_half_split_2))
  }

  # Stop the parallel backend
  stopImplicitCluster()

  # Combine every two sublists into a single list and create a new list of length iteration
  combined_list <- vector("list", iteration)
  for (i in 1:iteration) {
    combined_list[[i]] <- list(split_list[[2*i-1]], split_list[[2*i]])
  }

  return(combined_list)
}
