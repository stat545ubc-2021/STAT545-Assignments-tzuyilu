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
#'  ## If you want to choose data located in a specific area ("ARBUTUS-RIDGE") from the "vancouver_trees" dataset:
#'
#'   ## {Syntax}
#'  \dontrun{
#'  SubGrpSel(vancouver_trees,"neighbourhood_name","ARBUTUS-RIDGE")
#'  }
#'
#'   ## {Result}
#'   ## # A tibble: 5,169 × 20
#'   ## tree_id civic_number std_street  genus_name species_name cultivar_name common_name assigned root_barrier plant_area on_street_block on_street
#'   ## <dbl>        <dbl> <chr>       <chr>      <chr>        <chr>         <chr>       <chr>    <chr>        <chr>                <dbl> <chr>
#'   ## 1  155344         2408 W 18TH AV   ACER       SPECIES      NA            MAPLE SPEC… N        N            10                    3400 BALSAM ST
#'   ## 2  155720         2696 W 35TH AV   ACER       GRISEUM      NA            PAPERBARK … N        N            10                    2600 W 35TH AV
#'   ## 3  155874         3438 VALLEY DRI… FRAXINUS   OXYCARPA     RAYWOOD       RAYWOOD ASH N        N            8                     3400 VALLEY D…
#'   ## 4  156034         2106 W 19TH AV   FRAXINUS   OXYCARPA     RAYWOOD       RAYWOOD ASH N        N            8                     2100 W 19TH AV
#'   ## 5  156061         2659 W 19TH AV   FRAXINUS   AMERICANA    NA            WHITE ASH   N        N            6                     2600 W 19TH AV
#'   ## 6  156115         2489 W 21ST AV   FRAXINUS   OXYCARPA     RAYWOOD       RAYWOOD ASH N        N            8                     2400 W 21ST AV
#'   ## 7  156198         2225 W 21ST AV   FRAXINUS   OXYCARPA     RAYWOOD       RAYWOOD ASH N        N            8                     2200 W 21ST AV
#'   ## 8  156203         2345 W 21ST AV   FRAXINUS   OXYCARPA     RAYWOOD       RAYWOOD ASH N        N            8                     2300 W 21ST AV
#'   ## 9  156229         2457 W 22ND AV   FRAXINUS   OXYCARPA     RAYWOOD       RAYWOOD ASH N        N            7                     3700 VALLEY D…
#'   ## 10  156232         3888 VALLEY DRI… FRAXINUS   OXYCARPA     RAYWOOD       RAYWOOD ASH N        N            8                     3800 VALLEY D…
#'   ## # … with 5,159 more rows, and 8 more variables: neighbourhood_name <chr>, street_side_name <chr>, height_range_id <dbl>, diameter <dbl>,
#'   ## #   curb <chr>, date_planted <date>, longitude <dbl>, latitude <dbl>
#'
#'
#'   ## ## If you want to choose all "ACER" and "FRAXINUS" data from the "vancouver_trees" dataset:
#'
#'   ## {Syntax}
#'  \dontrun{
#'  SubGrpSel(vancouver_trees, "genus_name", c("ACER","FRAXINUS"))
#'  }
#'
#'   ## {Result}
#'   ## # A tibble: 43,443 × 20
#'   ## tree_id civic_number std_street  genus_name species_name cultivar_name common_name  assigned root_barrier plant_area
#'   ## <dbl>        <dbl> <chr>       <chr>      <chr>        <chr>         <chr>        <chr>    <chr>        <chr>
#'   ## 1  149590          858 E 39TH AV   FRAXINUS   AMERICANA    AUTUMN APPLA… AUTUMN APPL… Y        N            4
#'   ## 2  149604         5032 WINDSOR ST  ACER       CAMPESTRE    NA            HEDGE MAPLE  N        N            4
#'   ## 3  149617         4909 SHERBROOKE… ACER       PLATANOIDES  COLUMNARE     COLUMNAR NO… N        N            6
#'   ## 4  149618         4925 SHERBROOKE… ACER       PLATANOIDES  COLUMNARE     COLUMNAR NO… N        N            6
#'   ## 5  149619         4969 SHERBROOKE… ACER       PLATANOIDES  COLUMNARE     COLUMNAR NO… N        N            3
#'   ## 6  149625          720 E 39TH AV   FRAXINUS   AMERICANA    AUTUMN APPLA… AUTUMN APPL… N        N            3
#'   ## 7  149640         6968 SELKIRK ST  ACER       PLATANOIDES  COLUMNARE     COLUMNAR NO… N        N            N
#'   ## 8  149673         5241 WINDSOR ST  FRAXINUS   OXYCARPA     RAYWOOD       RAYWOOD ASH  N        N            4
#'   ## 9  149680         5311 WINDSOR ST  ACER       CAMPESTRE    NA            HEDGE MAPLE  N        N            4
#'   ## 10  149683         7011 SELKIRK ST  ACER       PLATANOIDES  COLUMNARE     COLUMNAR NO… N        N            N
#'   ## # … with 43,433 more rows, and 10 more variables: on_street_block <dbl>, on_street <chr>, neighbourhood_name <chr>,
#'   ## #   street_side_name <chr>, height_range_id <dbl>, diameter <dbl>, curb <chr>, date_planted <date>, longitude <dbl>,
#'   ## #   latitude <dbl>
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
