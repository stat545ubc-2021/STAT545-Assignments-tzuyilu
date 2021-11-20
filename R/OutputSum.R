#' @title  Outputting summarized information of a data set
#'
#' @description   This function generates a summary of specific columns.
#'
#' @param  input_data Data with planted_date of trees. This parameter should be a data frame.
#' @param  ref_date The Reference date for calculating the tree age of each observation. This parameter should be a string.
#' 
#' @return  Input data with a column of the tree age of each observation. 
#'          The output will be a data frame.
#' 
#' @importFrom magrittr %>%
#'
#' @export
#' @examples
#' TreeAgeCal(datateachr::vancouver_trees,"2021-11-20")
#' TreeAgeCal(datateachr::vancouver_trees,"2014-05-12")
#'

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
  
  # Generating the summary
  ind <- grep(ref_group, colnames(input_data))
  
  output_data <- input_data %>%
    dplyr::group_by(input_data[ind])%>%
    dplyr::summarise(dplyr::across(sum_col,.f=list("mean"=mean,"min"=min,"max"=max,"median"=min,"sd"=sd),na.rm=TRUE),n=n())

  # Visualizing the output data
  
  
  return(output_data)
}
