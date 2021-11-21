pkgname <- "ExtractData"
source(file.path(R.home("share"), "R", "examples-header.R"))
options(warn = 1)
base::assign(".ExTimings", "ExtractData-Ex.timings", pos = 'CheckExEnv')
base::cat("name\tuser\tsystem\telapsed\n", file=base::get(".ExTimings", pos = 'CheckExEnv'))
base::assign(".format_ptime",
function(x) {
  if(!is.na(x[4L])) x[1L] <- x[1L] + x[4L]
  if(!is.na(x[5L])) x[2L] <- x[2L] + x[5L]
  options(OutDec = '.')
  format(x[1L:3L], digits = 7L)
},
pos = 'CheckExEnv')

### * </HEADER>
library('ExtractData')

base::assign(".oldSearch", base::search(), pos = 'CheckExEnv')
base::assign(".old_wd", base::getwd(), pos = 'CheckExEnv')
cleanEx()
nameEx("OutputSum")
### * OutputSum

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: OutputSum
### Title: Outputting a summary
### Aliases: OutputSum

### ** Examples

## If you want to group the data set by "species_name" and then output the summary about "diameter":

 ## {Syntax}
 ## Not run: 
##D  OutputSum(vancouver_trees,"species_name","diameter")
##D  
## End(Not run)

 ## {Result}
 # A tibble: 283 × 7
 ## species_name   diameter_mean diameter_min diameter_max diameter_median diameter_sd     n
 ## <chr>                  <dbl>        <dbl>        <dbl>           <dbl>       <dbl> <int>
 ## 1 ABIES                  12.9           2           35               2          7.51   139
 ## 2 ACERIFOLIA   X         20.8           2           57               2         11.8   1724
 ## 3 ACUMINATA              10.9           2           28               2          9.91     7
 ## 4 ACUTISSIMA              8.87          2           36               2          4.33   526
 ## 5 AILANTHIFOLIA          32            24           40              24          6.44     5
 ## 6 ALBA                   19.4           1.5         40               1.5       14.4     26
 ## 7 ALBA-SINENSIS           8.67          7           10               7          1.53     3
 ## 8 ALNIFOLIA               5.23          2           20.2             2          2.65   274
 ## 9 ALPINUM                 8             8            8               8         NA        1
 ## 10 ALTISSIMA              15.9           3           21.5             3          8.64     4
 ## # … with 273 more rows

## If you want to generate a summary with multiple columns:
## {Syntax}
## Not run: 
##D OutputSum(vancouver_trees,"neighbourhood_name",c("diameter","height_range_id"))
## End(Not run)
## {Result}
# A tibble: 22 × 7
## neighbourhood_name       height_range_id_… height_range_id… height_range_id… height_range_id… height_range_id…     n
## <chr>                                <dbl>            <dbl>            <dbl>            <dbl>            <dbl> <int>
##   1 ARBUTUS-RIDGE                         2.72                0               10                0             1.55  5169
## 2 DOWNTOWN                              2.44                0                8                0             1.22  5159
## 3 DUNBAR-SOUTHLANDS                     3.03                0               10                0             1.93  9415
## 4 FAIRVIEW                              2.80                0                9                0             1.52  4002
## 5 GRANDVIEW-WOODLAND                    2.60                0                9                0             1.56  6703
## 6 HASTINGS-SUNRISE                      2.46                0                8                0             1.40 10547
## 7 KENSINGTON-CEDAR COTTAGE              2.60                0               10                0             1.42 11042
## 8 KERRISDALE                            2.81                0               10                0             1.69  6936
## 9 KILLARNEY                             2.50                0                9                0             1.26  6148
## 10 KITSILANO                             3.26                0               10                0             1.86  8115
## # … with 12 more rows



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("OutputSum", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("SubGrpSel")
### * SubGrpSel

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: SubGrpSel
### Title: Select subgroups in the data
### Aliases: SubGrpSel

### ** Examples

 ## If you want to choose data located in a specific area ("ARBUTUS-RIDGE") from the "vancouver_trees" dataset:

  ## {Syntax}
 ## Not run: 
##D  SubGrpSel(vancouver_trees,"neighbourhood_name","ARBUTUS-RIDGE")
##D  
## End(Not run)

  ## {Result}
  ## # A tibble: 5,169 × 20
  ## tree_id civic_number std_street  genus_name species_name cultivar_name common_name assigned root_barrier plant_area on_street_block on_street
  ## <dbl>        <dbl> <chr>       <chr>      <chr>        <chr>         <chr>       <chr>    <chr>        <chr>                <dbl> <chr>
  ## 1  155344         2408 W 18TH AV   ACER       SPECIES      NA            MAPLE SPEC… N        N            10                    3400 BALSAM ST
  ## 2  155720         2696 W 35TH AV   ACER       GRISEUM      NA            PAPERBARK … N        N            10                    2600 W 35TH AV
  ## 3  155874         3438 VALLEY DRI… FRAXINUS   OXYCARPA     RAYWOOD       RAYWOOD ASH N        N            8                     3400 VALLEY D…
  ## 4  156034         2106 W 19TH AV   FRAXINUS   OXYCARPA     RAYWOOD       RAYWOOD ASH N        N            8                     2100 W 19TH AV
  ## 5  156061         2659 W 19TH AV   FRAXINUS   AMERICANA    NA            WHITE ASH   N        N            6                     2600 W 19TH AV
  ## 6  156115         2489 W 21ST AV   FRAXINUS   OXYCARPA     RAYWOOD       RAYWOOD ASH N        N            8                     2400 W 21ST AV
  ## 7  156198         2225 W 21ST AV   FRAXINUS   OXYCARPA     RAYWOOD       RAYWOOD ASH N        N            8                     2200 W 21ST AV
  ## 8  156203         2345 W 21ST AV   FRAXINUS   OXYCARPA     RAYWOOD       RAYWOOD ASH N        N            8                     2300 W 21ST AV
  ## 9  156229         2457 W 22ND AV   FRAXINUS   OXYCARPA     RAYWOOD       RAYWOOD ASH N        N            7                     3700 VALLEY D…
  ## 10  156232         3888 VALLEY DRI… FRAXINUS   OXYCARPA     RAYWOOD       RAYWOOD ASH N        N            8                     3800 VALLEY D…
  ## # … with 5,159 more rows, and 8 more variables: neighbourhood_name <chr>, street_side_name <chr>, height_range_id <dbl>, diameter <dbl>,
  ## #   curb <chr>, date_planted <date>, longitude <dbl>, latitude <dbl>


  ## ## If you want to choose all "ACER" and "FRAXINUS" data from the "vancouver_trees" dataset:

  ## {Syntax}
 ## Not run: 
##D  SubGrpSel(vancouver_trees, "genus_name", c("ACER","FRAXINUS"))
##D  
## End(Not run)

  ## {Result}
  ## # A tibble: 43,443 × 20
  ## tree_id civic_number std_street  genus_name species_name cultivar_name common_name  assigned root_barrier plant_area
  ## <dbl>        <dbl> <chr>       <chr>      <chr>        <chr>         <chr>        <chr>    <chr>        <chr>
  ## 1  149590          858 E 39TH AV   FRAXINUS   AMERICANA    AUTUMN APPLA… AUTUMN APPL… Y        N            4
  ## 2  149604         5032 WINDSOR ST  ACER       CAMPESTRE    NA            HEDGE MAPLE  N        N            4
  ## 3  149617         4909 SHERBROOKE… ACER       PLATANOIDES  COLUMNARE     COLUMNAR NO… N        N            6
  ## 4  149618         4925 SHERBROOKE… ACER       PLATANOIDES  COLUMNARE     COLUMNAR NO… N        N            6
  ## 5  149619         4969 SHERBROOKE… ACER       PLATANOIDES  COLUMNARE     COLUMNAR NO… N        N            3
  ## 6  149625          720 E 39TH AV   FRAXINUS   AMERICANA    AUTUMN APPLA… AUTUMN APPL… N        N            3
  ## 7  149640         6968 SELKIRK ST  ACER       PLATANOIDES  COLUMNARE     COLUMNAR NO… N        N            N
  ## 8  149673         5241 WINDSOR ST  FRAXINUS   OXYCARPA     RAYWOOD       RAYWOOD ASH  N        N            4
  ## 9  149680         5311 WINDSOR ST  ACER       CAMPESTRE    NA            HEDGE MAPLE  N        N            4
  ## 10  149683         7011 SELKIRK ST  ACER       PLATANOIDES  COLUMNARE     COLUMNAR NO… N        N            N
  ## # … with 43,433 more rows, and 10 more variables: on_street_block <dbl>, on_street <chr>, neighbourhood_name <chr>,
  ## #   street_side_name <chr>, height_range_id <dbl>, diameter <dbl>, curb <chr>, date_planted <date>, longitude <dbl>,
  ## #   latitude <dbl>




base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("SubGrpSel", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("TmeDifCal")
### * TmeDifCal

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: TmeDifCal
### Title: Calculating time difference between two timestamps
### Aliases: TmeDifCal

### ** Examples


## If you want to calculate tree age based on the planted date and the specific date:

## {Syntax}
## Not run: 
##D TmeDifCal(vancouver_trees,"date_planted","2021-11-20","tree_age")
## End(Not run)

## {Result}
## # A tibble: 41,859 × 21
## tree_id civic_number std_street  genus_name species_name cultivar_name common_name  assigned root_barrier plant_area
## <dbl>        <dbl> <chr>       <chr>      <chr>        <chr>         <chr>        <chr>    <chr>        <chr>
## 1  149556          494 W 58TH AV   ULMUS      AMERICANA    BRANDON       BRANDON ELM  N        N            N
## 2  149590          858 E 39TH AV   FRAXINUS   AMERICANA    AUTUMN APPLA… AUTUMN APPL… Y        N            4
## 3  149617         4909 SHERBROOKE… ACER       PLATANOIDES  COLUMNARE     COLUMNAR NO… N        N            6
## 4  149618         4925 SHERBROOKE… ACER       PLATANOIDES  COLUMNARE     COLUMNAR NO… N        N            6
## 5  149619         4969 SHERBROOKE… ACER       PLATANOIDES  COLUMNARE     COLUMNAR NO… N        N            3
## 6  149625          720 E 39TH AV   FRAXINUS   AMERICANA    AUTUMN APPLA… AUTUMN APPL… N        N            3
## 7  149640         6968 SELKIRK ST  ACER       PLATANOIDES  COLUMNARE     COLUMNAR NO… N        N            N
## 8  149673         5241 WINDSOR ST  FRAXINUS   OXYCARPA     RAYWOOD       RAYWOOD ASH  N        N            4
## 9  149683         7011 SELKIRK ST  ACER       PLATANOIDES  COLUMNARE     COLUMNAR NO… N        N            N
## 10  149684         1223 W 54TH AV   ACER       PLATANOIDES  COLUMNARE     COLUMNAR NO… N        N            N



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("TmeDifCal", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("vancouver_trees")
### * vancouver_trees

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: vancouver_trees
### Title: Vancouver Street Trees
### Aliases: vancouver_trees
### Keywords: datasets

### ** Examples

vancouver_trees

head(vancouver_trees)
summary(vancouver_trees)



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("vancouver_trees", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
### * <FOOTER>
###
cleanEx()
options(digits = 7L)
base::cat("Time elapsed: ", proc.time() - base::get("ptime", pos = 'CheckExEnv'),"\n")
grDevices::dev.off()
###
### Local variables: ***
### mode: outline-minor ***
### outline-regexp: "\\(> \\)?### [*]+" ***
### End: ***
quit('no')
