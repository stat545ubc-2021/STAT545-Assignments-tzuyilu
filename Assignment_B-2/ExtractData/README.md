
<!-- README.md is generated from README.Rmd. Please edit that file -->

# ExtractData

<!-- badges: start -->

<!-- badges: end -->

The goal of ExtractData is to extract the interested data in a massive
data set (vancouver\_trees) for the following analysis. This package is
developed for the data analysis on STAT545B 2021W at UBC. The purpose is
to replace repeated codes in the assignments. The stored data
(“vancouver\_trees”) is a data set from “datateachr” package. There
are three functions in this package, including ‘SubGrpSel’, ‘TmeDifCal’,
and ‘OutputSum’. ‘SubGrpSel’ extracts data located in specific locations
within a tree dataset. ‘TmeDifCal’ computes the time lengths information
according to a vector including time information and the specified
reference date. ‘OutputSum’ generates a summary of chosen columns for
each group.

## Installation

This package is not yet on CRAN, you can download it from this
repository on github:

``` r
install.packages("devtools")
#> Installing package into '/private/var/folders/qv/k14kjsvs7gs2r20k_cfcqssc0000gn/T/RtmpWrbuEj/temp_libpath1e0d46eaa6a0'
#> (as 'lib' is unspecified)
#> 
#> The downloaded binary packages are in
#>  /var/folders/qv/k14kjsvs7gs2r20k_cfcqssc0000gn/T//RtmpPsMJKp/downloaded_packages
devtools::install_github("stat545ubc-2021/functions-tzuyilu/Assignment_B-2/ExtractData/")
#> Downloading GitHub repo stat545ubc-2021/functions-tzuyilu@HEAD
#> dplyr (ca5611050... -> 0189058d6...) [GitHub]
#> tidyr (84fc5bd2a... -> 265091d90...) [GitHub]
#> rlang (20b7fbda7... -> 5f4f4f473...) [GitHub]
#> Downloading GitHub repo tidyverse/dplyr@HEAD
#> rlang (20b7fbda7... -> 5f4f4f473...) [GitHub]
#> Downloading GitHub repo r-lib/rlang@HEAD
#>      checking for file ‘/private/var/folders/qv/k14kjsvs7gs2r20k_cfcqssc0000gn/T/RtmpPsMJKp/remotes25ca6d920aff/r-lib-rlang-5f4f4f4/DESCRIPTION’ ...  ✓  checking for file ‘/private/var/folders/qv/k14kjsvs7gs2r20k_cfcqssc0000gn/T/RtmpPsMJKp/remotes25ca6d920aff/r-lib-rlang-5f4f4f4/DESCRIPTION’
#>   ─  preparing ‘rlang’:
#>      checking DESCRIPTION meta-information ...  ✓  checking DESCRIPTION meta-information
#>   ─  cleaning src
#>   ─  checking for LF line-endings in source and make files and shell scripts (375ms)
#>   ─  checking for empty or unneeded directories
#>   ─  building ‘rlang_0.99.0.9000.tar.gz’
#>      
#> 
#> Installing package into '/private/var/folders/qv/k14kjsvs7gs2r20k_cfcqssc0000gn/T/RtmpWrbuEj/temp_libpath1e0d46eaa6a0'
#> (as 'lib' is unspecified)
#>      checking for file ‘/private/var/folders/qv/k14kjsvs7gs2r20k_cfcqssc0000gn/T/RtmpPsMJKp/remotes25ca1772fa61/tidyverse-dplyr-0189058/DESCRIPTION’ ...  ✓  checking for file ‘/private/var/folders/qv/k14kjsvs7gs2r20k_cfcqssc0000gn/T/RtmpPsMJKp/remotes25ca1772fa61/tidyverse-dplyr-0189058/DESCRIPTION’
#>   ─  preparing ‘dplyr’:
#>      checking DESCRIPTION meta-information ...  ✓  checking DESCRIPTION meta-information
#>   ─  cleaning src
#>   ─  installing the package to process help pages
#>   ─  cleaning src (8.6s)
#>   ─  checking for LF line-endings in source and make files and shell scripts
#>   ─  checking for empty or unneeded directories
#>    Removed empty directory ‘dplyr/inst’
#>   ─  building ‘dplyr_1.0.7.9000.tar.gz’
#>      
#> 
#> Installing package into '/private/var/folders/qv/k14kjsvs7gs2r20k_cfcqssc0000gn/T/RtmpWrbuEj/temp_libpath1e0d46eaa6a0'
#> (as 'lib' is unspecified)
#> Downloading GitHub repo tidyverse/tidyr@HEAD
#> 
#>      checking for file ‘/private/var/folders/qv/k14kjsvs7gs2r20k_cfcqssc0000gn/T/RtmpPsMJKp/remotes25ca39e390fa/tidyverse-tidyr-265091d/DESCRIPTION’ ...  ✓  checking for file ‘/private/var/folders/qv/k14kjsvs7gs2r20k_cfcqssc0000gn/T/RtmpPsMJKp/remotes25ca39e390fa/tidyverse-tidyr-265091d/DESCRIPTION’
#>   ─  preparing ‘tidyr’:
#>      checking DESCRIPTION meta-information ...  ✓  checking DESCRIPTION meta-information
#>   ─  cleaning src
#>   ─  checking for LF line-endings in source and make files and shell scripts
#>   ─  checking for empty or unneeded directories
#>   ─  building ‘tidyr_1.1.4.9000.tar.gz’
#>      
#> 
#> Installing package into '/private/var/folders/qv/k14kjsvs7gs2r20k_cfcqssc0000gn/T/RtmpWrbuEj/temp_libpath1e0d46eaa6a0'
#> (as 'lib' is unspecified)
#> Skipping install of 'rlang' from a github remote, the SHA1 (5f4f4f47) has not changed since last install.
#>   Use `force = TRUE` to force installation
#>      checking for file ‘/private/var/folders/qv/k14kjsvs7gs2r20k_cfcqssc0000gn/T/RtmpPsMJKp/remotes25ca1f32bb9e/stat545ubc-2021-STAT545-Assignments-tzuyilu-1563f0d/Assignment_B-2/ExtractData/DESCRIPTION’ ...  ✓  checking for file ‘/private/var/folders/qv/k14kjsvs7gs2r20k_cfcqssc0000gn/T/RtmpPsMJKp/remotes25ca1f32bb9e/stat545ubc-2021-STAT545-Assignments-tzuyilu-1563f0d/Assignment_B-2/ExtractData/DESCRIPTION’
#>   ─  preparing ‘ExtractData’:
#>   ✓  checking DESCRIPTION meta-information
#>   ─  checking for LF line-endings in source and make files and shell scripts
#>   ─  checking for empty or unneeded directories
#>   ─  building ‘ExtractData_1.0.0.tar.gz’
#>      
#> 
#> Installing package into '/private/var/folders/qv/k14kjsvs7gs2r20k_cfcqssc0000gn/T/RtmpWrbuEj/temp_libpath1e0d46eaa6a0'
#> (as 'lib' is unspecified)
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
## basic example code
library(ExtractData)
```

What is special about using `README.Rmd` instead of just `README.md`?
You can include R chunks like so:

``` r
# Demonstrating data stored in this package
summary(vancouver_trees)
#>     tree_id        civic_number    std_street         genus_name       
#>  Min.   :    12   Min.   :    0   Length:146611      Length:146611     
#>  1st Qu.: 65464   1st Qu.: 1306   Class :character   Class :character  
#>  Median :134903   Median : 2604   Mode  :character   Mode  :character  
#>  Mean   :131892   Mean   : 2937                                        
#>  3rd Qu.:194450   3rd Qu.: 4005                                        
#>  Max.   :266203   Max.   :17888                                        
#>                                                                        
#>  species_name       cultivar_name      common_name          assigned        
#>  Length:146611      Length:146611      Length:146611      Length:146611     
#>  Class :character   Class :character   Class :character   Class :character  
#>  Mode  :character   Mode  :character   Mode  :character   Mode  :character  
#>                                                                             
#>                                                                             
#>                                                                             
#>                                                                             
#>  root_barrier        plant_area        on_street_block  on_street        
#>  Length:146611      Length:146611      Min.   :   0    Length:146611     
#>  Class :character   Class :character   1st Qu.:1300    Class :character  
#>  Mode  :character   Mode  :character   Median :2600    Mode  :character  
#>                                        Mean   :2909                      
#>                                        3rd Qu.:4000                      
#>                                        Max.   :9900                      
#>                                                                          
#>  neighbourhood_name street_side_name   height_range_id     diameter     
#>  Length:146611      Length:146611      Min.   : 0.000   Min.   :  0.00  
#>  Class :character   Class :character   1st Qu.: 1.000   1st Qu.:  3.50  
#>  Mode  :character   Mode  :character   Median : 2.000   Median :  9.00  
#>                                        Mean   : 2.627   Mean   : 11.49  
#>                                        3rd Qu.: 4.000   3rd Qu.: 16.50  
#>                                        Max.   :10.000   Max.   :435.00  
#>                                                                         
#>      curb            date_planted          longitude         latitude    
#>  Length:146611      Min.   :1989-10-27   Min.   :-123.2   Min.   :49.20  
#>  Class :character   1st Qu.:1998-02-23   1st Qu.:-123.1   1st Qu.:49.23  
#>  Mode  :character   Median :2004-01-28   Median :-123.1   Median :49.25  
#>                     Mean   :2004-04-07   Mean   :-123.1   Mean   :49.25  
#>                     3rd Qu.:2010-03-02   3rd Qu.:-123.1   3rd Qu.:49.26  
#>                     Max.   :2019-07-03   Max.   :-123.0   Max.   :49.29  
#>                     NA's   :76548        NA's   :22771    NA's   :22771
head(vancouver_trees)
#>   tree_id civic_number std_street genus_name species_name   cultivar_name
#> 1  149556          494  W 58TH AV      ULMUS    AMERICANA         BRANDON
#> 2  149563          450  W 58TH AV    ZELKOVA      SERRATA            <NA>
#> 3  149579         4994 WINDSOR ST     STYRAX     JAPONICA            <NA>
#> 4  149590          858  E 39TH AV   FRAXINUS    AMERICANA AUTUMN APPLAUSE
#> 5  149604         5032 WINDSOR ST       ACER    CAMPESTRE            <NA>
#> 6  149616          585  W 61ST AV      PYRUS   CALLERYANA     CHANTICLEER
#>           common_name assigned root_barrier plant_area on_street_block
#> 1         BRANDON ELM        N            N          N             400
#> 2    JAPANESE ZELKOVA        N            N          N             400
#> 3   JAPANESE SNOWBELL        N            N          4            4900
#> 4 AUTUMN APPLAUSE ASH        Y            N          4             800
#> 5         HEDGE MAPLE        N            N          4            5000
#> 6    CHANTICLEER PEAR        N            N          B             500
#>    on_street       neighbourhood_name street_side_name height_range_id diameter
#> 1  W 58TH AV                  MARPOLE             EVEN               2       10
#> 2  W 58TH AV                  MARPOLE             EVEN               4       10
#> 3 WINDSOR ST KENSINGTON-CEDAR COTTAGE             EVEN               3        4
#> 4  E 39TH AV KENSINGTON-CEDAR COTTAGE             EVEN               4       18
#> 5 WINDSOR ST KENSINGTON-CEDAR COTTAGE             EVEN               2        9
#> 6  W 61ST AV                  MARPOLE              ODD               2        5
#>   curb date_planted longitude latitude
#> 1    N   1999-01-13 -123.1161 49.21776
#> 2    N   1996-05-31 -123.1147 49.21776
#> 3    Y   1993-11-22 -123.0846 49.23938
#> 4    Y   1996-04-29 -123.0870 49.23469
#> 5    Y   1993-12-17 -123.0846 49.23894
#> 6    Y         <NA> -123.1196 49.21513
```

You’ll still need to render `README.Rmd` regularly, to keep `README.md`
up-to-date. `devtools::build_readme()` is handy for this. You could also
use GitHub Actions to re-render `README.Rmd` every time you push. An
example workflow can be found here:
<https://github.com/r-lib/actions/tree/master/examples>.

# token of this repo: ghp\_5lgYqhoupKUvzlzICWNVjfTSL76hoR3fQhTy
