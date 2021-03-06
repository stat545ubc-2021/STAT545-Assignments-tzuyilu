% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/TmeDifCal.R
\name{TmeDifCal}
\alias{TmeDifCal}
\title{Calculating time difference between two timestamps}
\usage{
TmeDifCal(input_data, start_date, end_date, n_col_name)
}
\arguments{
\item{input_data}{Data with time information.
This parameter should be a data frame.}

\item{start_date}{One of the columns in a data set serving as the beginning of the time length calculation.
This parameter should be a character, which must be one of the columns of input_data.}

\item{end_date}{A specific date for serving as the end of the time length calculation.
This parameter should be a character.}

\item{n_col_name}{The name for the new column you created by this function.}
}
\value{
Input data with a column of the time length of each observation.
The output will be a data frame.
}
\description{
This function calculates the time lengths between two timestamps of each observation in the input.
}
\examples{

## If you want to calculate tree age based on the planted date and the specific date:
## {Syntax}
\dontrun{
TmeDifCal(vancouver_trees,"date_planted","2021-11-20","tree_age")
}
}
