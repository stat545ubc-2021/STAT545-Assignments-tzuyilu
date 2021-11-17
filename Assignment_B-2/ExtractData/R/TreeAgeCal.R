#' @title  Calculating the tree ages
#'
#' @description   This function calculates the tree age of each observation in the input.
#'
#' @param  input_data Data with planted_date of trees. This parameter should be a data frame.
#' @param  ref_date The Reference date for calculating the tree age of each observation. This parameter should be a string.
#'
#' @return  A new data with a column of the tree age of each observation. The output will be a data frame.
#' @importFrom magrittr %>%
#'
#' @export
#' @examples
#' TreeAgeCal(datateachr::vancouver_trees,"2021-11-20")
#' TreeAgeCal(datateachr::vancouver_trees,"2014-05-12")
#'

TreeAgeCal <- function(input_data,ref_date) {
  if (!is.data.frame(input_data)) {
    stop("The input data is not a data frame. The input data is ", class(input_data))
  }
  if (!is.character(ref_date)) {
    stop("The ref_date is not a character. The ref_date is ", class(ref_date))
  }

  output_data <- dplyr::mutate(input_data$tree_age = as.numeric(difftime(as.Date(ref_date),input_data$date_planted))/365) %>%
    tidyr::drop_na()
  return(output_data)
}
