
<!-- README.md is generated from README.Rmd. Please edit that file -->

# ExtractData

<!-- badges: start -->

<!-- badges: end -->

The goal of ExtractData is to extract the interested data in a massive
data (vancouver\_trees) set for the following analysis.

## Installation

This package is not yet on CRAN, you can download it from this
repository on github:

``` r
# install.packages("devtools")
devtools::install_github("stat545ubc-2021/functions-tzuyilu/Assignment_B-2/ExtractData/")
```

## Example

This is a basic example which shows you how to solve a common problem:

\#`{r example} ## basic example code #library(ExtractData) #`

What is special about using `README.Rmd` instead of just `README.md`?
You can include R chunks like so:

``` r
#summary(vancouver_trees)
#head(vancouver_trees)
```

You’ll still need to render `README.Rmd` regularly, to keep `README.md`
up-to-date. `devtools::build_readme()` is handy for this. You could also
use GitHub Actions to re-render `README.Rmd` every time you push. An
example workflow can be found here:
<https://github.com/r-lib/actions/tree/master/examples>.
