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
#'
#'  ## {Syntax}
#'  \dontrun{
#'  OutputSum(vancouver_trees,"species_name","diameter")
#'  }
#'
#'  ## {Result}
#'  # A tibble: 283 × 7
#'  ## species_name   diameter_mean diameter_min diameter_max diameter_median diameter_sd     n
#'  ## <chr>                  <dbl>        <dbl>        <dbl>           <dbl>       <dbl> <int>
#'  ## 1 ABIES                  12.9           2           35               2          7.51   139
#'  ## 2 ACERIFOLIA   X         20.8           2           57               2         11.8   1724
#'  ## 3 ACUMINATA              10.9           2           28               2          9.91     7
#'  ## 4 ACUTISSIMA              8.87          2           36               2          4.33   526
#'  ## 5 AILANTHIFOLIA          32            24           40              24          6.44     5
#'  ## 6 ALBA                   19.4           1.5         40               1.5       14.4     26
#'  ## 7 ALBA-SINENSIS           8.67          7           10               7          1.53     3
#'  ## 8 ALNIFOLIA               5.23          2           20.2             2          2.65   274
#'  ## 9 ALPINUM                 8             8            8               8         NA        1
#'  ## 10 ALTISSIMA              15.9           3           21.5             3          8.64     4
#'  ## # … with 273 more rows
#'
#' ## If you want to generate a summary with multiple columns:
#' ## {Syntax}
#' \dontrun{
#' OutputSum(vancouver_trees,"neighbourhood_name",c("diameter","height_range_id"))
#' }
#' ## {Result}
#' # A tibble: 22 × 7
#' ## neighbourhood_name       height_range_id_… height_range_id… height_range_id… height_range_id… height_range_id…     n
#' ## <chr>                                <dbl>            <dbl>            <dbl>            <dbl>            <dbl> <int>
#' ##   1 ARBUTUS-RIDGE                         2.72                0               10                0             1.55  5169
#' ## 2 DOWNTOWN                              2.44                0                8                0             1.22  5159
#' ## 3 DUNBAR-SOUTHLANDS                     3.03                0               10                0             1.93  9415
#' ## 4 FAIRVIEW                              2.80                0                9                0             1.52  4002
#' ## 5 GRANDVIEW-WOODLAND                    2.60                0                9                0             1.56  6703
#' ## 6 HASTINGS-SUNRISE                      2.46                0                8                0             1.40 10547
#' ## 7 KENSINGTON-CEDAR COTTAGE              2.60                0               10                0             1.42 11042
#' ## 8 KERRISDALE                            2.81                0               10                0             1.69  6936
#' ## 9 KILLARNEY                             2.50                0                9                0             1.26  6148
#' ## 10 KITSILANO                             3.26                0               10                0             1.86  8115
#' ## # … with 12 more rows

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
