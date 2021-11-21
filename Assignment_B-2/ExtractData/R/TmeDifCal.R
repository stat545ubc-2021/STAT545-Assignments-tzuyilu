#' @title  Calculating time difference between two timestamps
#'
#' @description   This function calculates the time lengths between two timestamps of each observation in the input.
#'
#' @param  input_data Data with time information.
#' This parameter should be a data frame.
#' @param  start_date One of the columns in a data set serving as the beginning of the time length calculation.
#' This parameter should be a character, which must be one of the columns of input_data.
#' @param  end_date A specific date for serving as the end of the time length calculation.
#' This parameter should be a character.
#' @param  n_col_name The name for the new column you created by this function.
#'
#'
#' @return  Input data with a column of the time length of each observation.
#'          The output will be a data frame.
#'
#' @importFrom magrittr %>%
#'
#' @export
#' @examples
#'
#' ## If you want to calculate tree age based on the planted date and the specific date:
#' ## {Syntax}
#' \dontrun{
#' TmeDifCal(vancouver_trees,"date_planted","2021-11-20","tree_age")
#' }


TmeDifCal <- function(input_data,start_date,end_date,n_col_name) {
  if (!is.data.frame(input_data)) {
    stop("The input data is not a data frame. The input data is ", class(input_data))
  }

  if (is.na(match(start_date,names(input_data)))) {
    stop("Please check the [start_date] variable again. There is no column named ",start_date,'.')
  }

  # Creating expression
  exp_text <- paste('output_data <- input_data %>%
  dplyr::mutate(',n_col_name,' = as.numeric(difftime(as.Date(end_date),as.Date(',start_date,')))/365) %>%
                    tidyr::drop_na()',sep='')

  # Evaluating expression
  eval(parse(text=exp_text))

  return(output_data)
}
