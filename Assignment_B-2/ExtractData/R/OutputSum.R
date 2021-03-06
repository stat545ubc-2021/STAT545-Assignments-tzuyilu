#' @title  Outputting a summary
#'
#' @description   This function generates a summary of specific columns from the input data.
#' Users can flip through the data easily.
#'
#' @param  input_data Data with planted_date of trees. This parameter should be a data frame.
#' @param  ref_group The grouping basis of the data. This parameter should be a string.
#' @param  sum_col The columns you want to generate summarized information.
#'
#' @return  A data set with summarized information of specified columns.
#'          The output will be a data frame.
#'
#' @importFrom magrittr %>%
#'
#' @export
#' @examples
#' ## If you want to group the data set by "species_name" and then output the summary about "diameter":
#' ## {Syntax}
#'  \dontrun{
#'  OutputSum(vancouver_trees,"species_name","diameter")
#'  }
#'
#'
#' ## If you want to generate a summary with multiple columns:
#' ## {Syntax}
#' \dontrun{
#' OutputSum(vancouver_trees,"neighbourhood_name",c("diameter","height_range_id"))
#' }

OutputSum <- function(input_data,ref_group,sum_col) {

  # Check the classes of inputted variables
  if (!is.data.frame(input_data)) {
    stop("The input data is not a data frame. The input data is ", class(input_data))
  }
  if (!is.character(ref_group)) {
    stop("The ref_group is not a character. The ref_group is ", class(ref_date))
  }
  if (!is.character(sum_col)) {
    stop("The sum_col is not a character. The sum_col is ", class(ref_date))
  }
  if (is.na(match(ref_group,names(input_data)))){
    stop("There is no column name ",ref_group," in your input_data. Please check again.")
  }

  for (i in length(sum_col)){
    if (is.na(match(sum_col[i],names(input_data)))){
      stop("There is no column name ",sum_col," in your input_data. Please check again.")
    }
  }


  # Creating expression
  exp_text <- paste('output_data <- input_data %>%
    dplyr::group_by(',ref_group,')%>%
    dplyr::summarise(dplyr::across(',sum_col,',.f=list("mean"=mean,"min"=min,"max"=max,"median"=min,"sd"=sd),na.rm=TRUE),n=dplyr::n())',sep='')

  # Evaluating expression
  eval(parse(text=exp_text))

  return(output_data)
}
