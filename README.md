
<!-- README.md is generated from README.Rmd. Please edit that file -->

# Lab5

<!-- badges: start -->

[![R-CMD-check](https://github.com/albba064/Lab5/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/albba064/Lab5/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

Lab5 is a R package to handle requests to USGS Catalog API.

## Installation

You can install the development version of Lab5 from
[GitHub](https://github.com/) with:

``` r
# install.packages("pak")
pak::pak("albba064/Lab5")
```

Or if you want to install with vignettes:

``` r
devtools::install_github("albba064/Lab5", build_vignettes = TRUE)
```

## Example

### Load data from API

``` r
library(Lab5)

data <- earthquake_API(
  starttime = "2026-10-01",
  endtime = "2026-10-05",
  min_magnitude = 5,
  max_magnitude = 10
)

knitr::kable(head(data))
```

| time | latitude | longitude | mag | place |
|:---|---:|---:|---:|:---|
| 2026-10-04 14:06:10 | 5.3695 | -82.7171 | 5.0 | 295 km S of Burica, Panama |
| 2026-10-04 11:43:23 | 37.7292 | 36.1272 | 5.0 | 21 km ESE of Feke, Turkey |
| 2026-10-04 11:12:48 | 22.8191 | 144.6508 | 5.1 | Volcano Islands, Japan region |
| 2026-10-04 10:13:07 | -8.2698 | 120.4532 | 5.0 | 37 km N of Ruteng, Indonesia |
| 2026-10-03 23:37:34 | 4.8247 | 95.1622 | 5.3 | 81 km SSW of Banda Aceh, Indonesia |
| 2026-10-03 22:55:55 | -9.5672 | 118.9078 | 5.9 | 39 km WSW of Tambolaka, Indonesia |
