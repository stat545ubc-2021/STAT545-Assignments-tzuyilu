#' @tilte Select targeted regions in the data
#'
#' @description  This function selects the specified regions in the data.
#'
#' @params input_data Data with planted_date of trees. This parameter should be a data frame.
#' @params chosen_area The areas you are interested in. This parameter should be a string.
#'
#' @return A filtered data in the interested regions. The output will be a data frame.
#'
#' @export
#' @examples
#' RegionSel(input_data,"ARBUTUS-RIDGE")
#' RegionSel(input_data,c("ARBUTUS-RIDGE","DUNBAR-SOUTHLANDS","KITSILANO","SHAUGHNESSY","WEST POINT GREY"))
#'

RegionSel <- function(input_data,chosen_area) {
  if (!is.data.frame(input_data)) {
    stop("The input data is not a data frame. The input data is ", class(input_data))
  }
  if (!is.character(chosen_area)) {
    stop("The chosen_area variable is not a string. The chosen_area is ", class(chosen_area))
  }

  output_data <-input_data %>%
    dplyr::filter(neighbourhood_name  %in% chosen_area)
  return(output_data)
}
