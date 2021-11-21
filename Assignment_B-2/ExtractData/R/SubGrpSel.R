#' @title  Select subgroups in the data
#'
#' @description   This function pulls out the specified categories in the data.
#'
#' @param  input_data Data with planted_date of trees. This parameter should be a data frame.
#' @param  col_name The column which you will extract categories. This parameter should be a character.
#' @param  chosen_grp The areas you are interested in. This parameter should be a character.
#'
#' @return A filtered data in the interested regions. The output will be a data frame.
#' @importFrom magrittr %>%
#'
#' @export
#' @examples
#' ## If you want to choose data located in a specific area ("ARBUTUS-RIDGE") from
#' ## the "vancouver_trees" dataset:
#'
#' ## {Syntax}
#'  \dontrun{
#'  SubGrpSel(vancouver_trees,"neighbourhood_name","ARBUTUS-RIDGE")
#'  }
#'
#'
#' ##If you want to choose all "ACER" and "FRAXINUS" data from the "vancouver_trees" dataset:
#' ## {Syntax}
#'  \dontrun{
#'  SubGrpSel(vancouver_trees, "genus_name", c("ACER","FRAXINUS"))
#'  }
#'

SubGrpSel<- function(input_data, col_name, chosen_grp) {
  if (!is.data.frame(input_data)) {
    stop("The input data is not a data frame. The input data is ", class(input_data))
  }

  if (!is.character(col_name)) {
    stop("The col_name variable is not a character. The col_name is ", class(chosen_area))
  }

  if (!is.character(chosen_grp)) {
      stop("The chosen_grp variable is not a character. The chosen_grp is ", class(chosen_area))
  }

  # Creating expression
  exp_text <- paste('output_data <- dplyr::filter(input_data,',col_name,'%in% chosen_grp)')
  # Evaluating expression
  eval(parse(text=exp_text))

  return(output_data)
}
