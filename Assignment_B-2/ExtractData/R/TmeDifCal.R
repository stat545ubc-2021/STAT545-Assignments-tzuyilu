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
#' @param  n_col_name The name for the new column you create in this function.
#'
#'
#' @return  Input data with a column of time length of each observation.
#'          The output will be a data frame.
#'
#' @importFrom magrittr %>%
#'
#' @export
#' @examples
#' TmeDifCal(vancouver_trees,"date_planted","2021-11-20","tree_age")
#'
#'

TmeDifCal <- function(input_data,start_date,end_date,n_col_name) {
  if (!is.data.frame(input_data)) {
    stop("The input data is not a data frame. The input data is ", class(input_data))
  }

  if (is.na(match(start_date,names(input_data)))) {
    stop("Please check the [start_date] variable again. There is no column named ",start_date,'.')
  }

  # Creating expression
  exp_text <- paste('output_data <- input_data %>%
    dplyr::mutate(',n_col_name,' = as.numeric(difftime(as.Date(start_date),end_date))/365) %>%
    tidyr::drop_na()',sep='')
  # Evaluating expression
  eval(parse(text=exp_text))

  return(output_data)
}
