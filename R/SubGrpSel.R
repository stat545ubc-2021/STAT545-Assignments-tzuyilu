#' @title  Select subgroups in the data
#'
#' @description   This function pulls out the specified categories in the data.
#'
#' @param  input_data Data with planted_date of trees. This parameter should be a data frame.
#' @param  chosen_grp The areas you are interested in. This parameter should be a character.
#'
#' @return A filtered data in the interested regions. The output will be a data frame.
#' @importFrom magrittr %>%
#'
#' @export
#' @examples
#' If you want to choose data located in a specific area ("ARBUTUS-RIDGE") from the "vancouver_trees" dataset:
#'  {Syntax} → SubGrpSel(vancouver_trees,"neighbourhood_name","ARBUTUS-RIDGE")
#'  {Result}
#'  # A tibble: 5,169 × 20
#'  tree_id civic_number std_street  genus_name species_name cultivar_name common_name assigned root_barrier plant_area on_street_block on_street
#'  <dbl>        <dbl> <chr>       <chr>      <chr>        <chr>         <chr>       <chr>    <chr>        <chr>                <dbl> <chr>
#'  1  155344         2408 W 18TH AV   ACER       SPECIES      NA            MAPLE SPEC… N        N            10                    3400 BALSAM ST
#'  2  155720         2696 W 35TH AV   ACER       GRISEUM      NA            PAPERBARK … N        N            10                    2600 W 35TH AV
#'  3  155874         3438 VALLEY DRI… FRAXINUS   OXYCARPA     RAYWOOD       RAYWOOD ASH N        N            8                     3400 VALLEY D…
#'  4  156034         2106 W 19TH AV   FRAXINUS   OXYCARPA     RAYWOOD       RAYWOOD ASH N        N            8                     2100 W 19TH AV
#'  5  156061         2659 W 19TH AV   FRAXINUS   AMERICANA    NA            WHITE ASH   N        N            6                     2600 W 19TH AV
#'  6  156115         2489 W 21ST AV   FRAXINUS   OXYCARPA     RAYWOOD       RAYWOOD ASH N        N            8                     2400 W 21ST AV
#'  7  156198         2225 W 21ST AV   FRAXINUS   OXYCARPA     RAYWOOD       RAYWOOD ASH N        N            8                     2200 W 21ST AV
#'  8  156203         2345 W 21ST AV   FRAXINUS   OXYCARPA     RAYWOOD       RAYWOOD ASH N        N            8                     2300 W 21ST AV
#'  9  156229         2457 W 22ND AV   FRAXINUS   OXYCARPA     RAYWOOD       RAYWOOD ASH N        N            7                     3700 VALLEY D…
#'  10  156232         3888 VALLEY DRI… FRAXINUS   OXYCARPA     RAYWOOD       RAYWOOD ASH N        N            8                     3800 VALLEY D…
#'  # … with 5,159 more rows, and 8 more variables: neighbourhood_name <chr>, street_side_name <chr>, height_range_id <dbl>, diameter <dbl>,
#'  #   curb <chr>, date_planted <date>, longitude <dbl>, latitude <dbl>
#'
#'
#' If you want to choose all "ACER" and "FRAXINUS" data from the "vancouver_trees" dataset:
#'  {Syntax} → SubGrpSel(vancouver_trees, "genus_name", c("ACER","FRAXINUS"))
#'  {Result}
#'

SubGrpSel<- function(input_data, col_name, chosen_grp) {
  
  # Checking the formats of inputs are correct 
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
  expression <- paste('output_data <- dplyr::filter(input_data,',col_name,'%in% chosen_grp)')
  # Evaluating expression
  eval(parse(text=expression))
  
  return(output_data)
}
