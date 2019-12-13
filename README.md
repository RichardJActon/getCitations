
<!-- README.md is generated from README.Rmd. Please edit that file -->

# getCitations

<!-- badges: start -->

[![Travis build
status](https://travis-ci.org/RichardJActon/getCitations.svg?branch=master)](https://travis-ci.org/RichardJActon/getCitations)
[![Codecov test
coverage](https://codecov.io/gh/RichardJActon/getCitations/branch/master/graph/badge.svg)](https://codecov.io/gh/RichardJActon/getCitations?branch=master)
<!-- badges: end -->

The goal of getCitations is to get all the citaions from your Rmarkdown
files and select a subset of your main citations library for
distribution with your project

## Installation

The development version from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("RichardJActon/getCitations")
```

## Example

``` r
library(getCitations)

myRmd <- system.file("extdata", "exampleNotebook.Rmd", package = "getCitations")
getCitations(
    myRmd, # Rmd file or vector thereof
    "./local.bib" # destination for local library
)
#> Warning: distinct() does not fully support columns of type `list`.
#> List elements are compared by reference, see ?distinct for details.
#> This affects the following columns:
#> - `AUTHOR`, `EDITOR`
```
