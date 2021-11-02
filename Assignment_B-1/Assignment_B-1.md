Assignment\_B-1
================
Tzu-Yi Lu,
2021 Nov 02

``` r
# Load the packages used in this file.
library(dplyr)
```

    ## 
    ## Attaching package: 'dplyr'

    ## The following objects are masked from 'package:stats':
    ## 
    ##     filter, lag

    ## The following objects are masked from 'package:base':
    ## 
    ##     intersect, setdiff, setequal, union

``` r
library(tidyr)
library(testthat)
```

    ## 
    ## Attaching package: 'testthat'

    ## The following object is masked from 'package:tidyr':
    ## 
    ##     matches

    ## The following object is masked from 'package:dplyr':
    ## 
    ##     matches

``` r
library(datateachr)
```

### Exercise 1: Make a Function && Exercise 2: Document your Function

In my **milestones 1\~3** submitted to STAT545A, I kept extracting a
specific subset from a current dataset. Therefore, I decided to create a
function that helps me with extracting a subgroup from the
“**vancouver\_trees**” dataset.

I named the function “**extract\_dat**”, which means extracting data.

``` r
#' @tilte Extracting a subset for the tree growth analysis
#' @description  This function calculates the tree age of each observation in the input and then extracts a subset from it according to the specified area(s).
#' @params input_data: The imported data for extracting a subset. This parameter should be a data frame.
#' @params chosen_area The areas you want. This parameter should be a string.
#' @params ref_date The reference date for calculating the tree age of each observation. This parameter should be a string. 
#' @return The observations of the input_data located in the "chosen_area". The output will be a data frame.
#' 
extract_dat <- function(input_data,chosen_area,ref_date) {
  if (!is.data.frame(input_data)) {
    stop("The input data is not a data frame. The input data is ", class(input_data))
  }
  if (!is.character(chosen_area)) {
    stop("The chosen_area variable is not a string. The chosen_area is ", class(chosen_area))
  }
  if (!is.character(ref_date)) {
    stop("The ref_date is not a character. The ref_date is ", class(ref_date))
  }
  
  output_data <-input_data %>%
    dplyr::mutate(tree_age = as.numeric(difftime(as.Date(ref_date),date_planted))/365) %>%
    tidyr::drop_na() %>%
    dplyr::filter(neighbourhood_name  %in% chosen_area)
  return(output_data)
  }
```

## Exercise 3: Examples

### Example 1:

The way which I used in my milestones. I extracted datasets in the
**specified 5 areas** every time before I started my tree growth
analysis.

``` r
# Define the areas I need.
chosen_area <- c("ARBUTUS-RIDGE","DUNBAR-SOUTHLANDS","KITSILANO","SHAUGHNESSY","WEST POINT GREY")

# Run the function
VanTreeUBC <- extract_dat(vancouver_trees, chosen_area, "2021-11-02")
head(VanTreeUBC)
```

    ## # A tibble: 6 × 21
    ##   tree_id civic_number std_street   genus_name species_name cultivar_name   
    ##     <dbl>        <dbl> <chr>        <chr>      <chr>        <chr>           
    ## 1  155373         1900 CYPRESS ST   PRUNUS     CERASIFERA   NIGRA           
    ## 2  155413         2485 W BROADWAY   ULMUS      AMERICANA    BRANDON         
    ## 3  155430         4632 W 12TH AV    PYRUS      CALLERYANA   CHANTICLEER     
    ## 4  155445         2408 W 13TH AV    ACER       FREEMANI   X SCARLET SENTINEL
    ## 5  155446         2246 W 15TH AV    ACER       RUBRUM       KARPICK         
    ## 6  155874         3438 VALLEY DRIVE FRAXINUS   OXYCARPA     RAYWOOD         
    ## # … with 15 more variables: common_name <chr>, assigned <chr>,
    ## #   root_barrier <chr>, plant_area <chr>, on_street_block <dbl>,
    ## #   on_street <chr>, neighbourhood_name <chr>, street_side_name <chr>,
    ## #   height_range_id <dbl>, diameter <dbl>, curb <chr>, date_planted <date>,
    ## #   longitude <dbl>, latitude <dbl>, tree_age <dbl>

### Example 2:

If I want to extract observations located in **“ARBUTUS-RIDGE”** only,
and investigate the tree growth condition in **2015-Jan-01**, I can use
the function in this way:

``` r
VanTree_ARB_2015 <- extract_dat(vancouver_trees, "ARBUTUS-RIDGE", "2015-01-01")
head(VanTree_ARB_2015)
```

    ## # A tibble: 6 × 21
    ##   tree_id civic_number std_street   genus_name species_name cultivar_name
    ##     <dbl>        <dbl> <chr>        <chr>      <chr>        <chr>        
    ## 1  155874         3438 VALLEY DRIVE FRAXINUS   OXYCARPA     RAYWOOD      
    ## 2  156034         2106 W 19TH AV    FRAXINUS   OXYCARPA     RAYWOOD      
    ## 3  156115         2489 W 21ST AV    FRAXINUS   OXYCARPA     RAYWOOD      
    ## 4  156198         2225 W 21ST AV    FRAXINUS   OXYCARPA     RAYWOOD      
    ## 5  156203         2345 W 21ST AV    FRAXINUS   OXYCARPA     RAYWOOD      
    ## 6  156229         2457 W 22ND AV    FRAXINUS   OXYCARPA     RAYWOOD      
    ## # … with 15 more variables: common_name <chr>, assigned <chr>,
    ## #   root_barrier <chr>, plant_area <chr>, on_street_block <dbl>,
    ## #   on_street <chr>, neighbourhood_name <chr>, street_side_name <chr>,
    ## #   height_range_id <dbl>, diameter <dbl>, curb <chr>, date_planted <date>,
    ## #   longitude <dbl>, latitude <dbl>, tree_age <dbl>

### Example 3:

If I type in more than one date string in the ref\_date, an error will
occur while running this function.

``` r
VanTree_err <- extract_dat(vancouver_trees, "ARBUTUS-RIDGE", c("2021-01-01","2021-11-02"))
```

    ## Warning in unclass(time1) - unclass(time2): longer object length is not a
    ## multiple of shorter object length

## Exercise 4: Test the Function

In the tree growth analysis, the tree age (which is computed by the
“**extract\_dat**” function) is a critical variable.

The datasets with NA value in the tree\_age column do not make sense in
the following analysis. Therefore, I need to make sure that all the NA
values are excluded in this column. Thus, the first test is to check
that there is **no NA value in tree\_age column**.

Besides, the tree\_age column should be a numeric variable for the
following analysis. I also checked **the class of the tree\_age
column**.

Finally, I want to confirm the class of the output variable as a data
frame.

Here I will test the **VanTreeUBC** variable I got in the **Chunk 3**,
and check the **tree\_age** column in it.

``` r
chk <- test_that("Check the tree_age column in the subset.", {
  expect_equal(is.na(VanTreeUBC$tree_age), rep(FALSE,length(VanTreeUBC$tree_age)))
  expect_true(is.numeric(VanTreeUBC$tree_age))
  expect_true(is.data.frame(VanTreeUBC))
})
```

    ## Test passed 😸
