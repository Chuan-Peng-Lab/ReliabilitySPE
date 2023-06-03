#' Title
#'
#' @param df.split 被分半的list
#' @param method 分半方法
#' @param sub 被试
#' @param var1 变量1
#' @param var2 变量2
#' @param var3 变量3
#'
#' @return 返回分半的结果
#' @export 返回分半的结果

other <- function(df.split, method, sub, var1, var2, var3) {

  # Set the seed to fix the output value
  set.seed(123)

  # Scientific notation
  options(scipen = 999)

  # Stratify the data by Match and Identity
  split_data <- split(df.split, list(df.split[[sub]], df.split[[var1]],
                                     df.split[[var2]], df.split[[var3]]))

  # Initialize empty lists to store the split-half data sets
  str_half_split_1 <- list()
  str_half_split_2 <- list()

  # Calculate the split-half reliability for each group
  str_half_split <- lapply(split_data, function(x) {

    # Remove rows with missing values
    data <- x[complete.cases(x),]


    if(method == "permuted") {
      # Permute the rows of the data and split it into two halves
      permuted_data <- data[sample(nrow(data)),]
      half_split_1 <- permuted_data[1:floor(nrow(permuted_data)/2),]
      half_split_2 <- permuted_data[(floor(nrow(permuted_data)/2)+1):nrow(permuted_data),]
    }
    else if(method == "fs") {
      # Split the data into two subsets using a first-second split
      half_split_1 <- data[1:floor(nrow(data)/2),]
      half_split_2 <- data[(floor(nrow(data)/2)+1):nrow(data),]
    }
    else {
      # Create a vector of row indices
      row_indices <- seq(1, nrow(data))
      # Select the odd-numbered indices for one split-half group
      half_split_1 <- data[row_indices %% 2 == 1, ]
      # Select the even-numbered indices for the other split-half group
      half_split_2 <- data[row_indices %% 2 == 0, ]
    }

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

  split_list <- list(str_half_split_1, str_half_split_2)

  return(split_list)
}
