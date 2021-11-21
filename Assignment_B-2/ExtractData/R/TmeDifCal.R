#' @title  Calculating time length
#'
#' @description   This function calculates the tree age of each observation in the input.
#'
#' @param  input_data Data with planted_date of trees.
#' This parameter should be a data frame.
#' @param  start_date One of columns in a data set.
#' This parameter should be a character, which must be one of the columns of input_data.
#' @param  end_date Either a specified date or another column as the end date.
#' This parameter should be a character.
#' @return  Input data with a column of time length of each observation.
#'          The output will be a data frame.
#'
#' @importFrom magrittr %>%
#'
#' @export
#' @examples
#' TmeDifCal(vancouver_trees,"date_planted","2021-11-20")
#'
#'

TmeDifCal <- function(input_data,start_date,end_date) {
  if (!is.data.frame(input_data)) {
    stop("The input data is not a data frame. The input data is ", class(input_data))
  }

  if (is.na(match(start_date,names(input_data)))) {
    stop("Please specify one of the column as the start_date. There is no column named ",start_date,'.')
  }


  output_data <- input_data %>%
    dplyr::mutate(tree_age = as.numeric(difftime(as.Date(ref_date),date_planted))/365) %>%
    tidyr::drop_na()
  return(output_data)
}
