
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
#> ℹ Loading metadata database
#> ✔ Loading metadata database ... done
#> 
#> 
#> → Package library at '/private/var/folders/8c/dxmkxzf103bbz71tv2f17bc40000gn/T/RtmppysCXq/temp_libpathc2a37c01a956'.
#> → Will install 28 packages.
#> → Will update 1 package.
#> → Will download 29 packages with unknown size.
#> + askpass            1.2.1  🔧 ⬇
#> + bit                4.6.0  🔧 ⬇
#> + bit64              4.8.6  🔧 ⬇
#> + cli                3.6.6  🔧 ⬇
#> + clipr              0.8.1   ⬇
#> + crayon             1.5.3   ⬇
#> + curl               8.0.0  🔧 ⬇
#> + glue               1.8.1  🔧 ⬇
#> + hms                1.1.4   ⬇
#> + httr               1.4.9   ⬇
#> + jsonlite           2.0.0  🔧 ⬇
#> + Lab5       0.1.0 → 0.1.0  👷🏾‍♀️🔧 ⬇ (GitHub: 2f7dfa1)
#> + lifecycle          1.0.5   ⬇
#> + magrittr           2.0.5  🔧 ⬇
#> + mime               0.13   🔧 ⬇
#> + openssl            2.4.2  🔧 ⬇
#> + pillar             1.11.1  ⬇
#> + pkgconfig          2.0.3   ⬇
#> + R6                 2.6.1   ⬇
#> + readr              2.2.0  🔧 ⬇
#> + rlang              1.3.0  🔧 ⬇
#> + sys                3.4.3  🔧 ⬇
#> + tibble             3.3.1  🔧 ⬇
#> + tidyselect         1.2.1   ⬇
#> + tzdb               0.5.0  🔧 ⬇
#> + utf8               1.2.6  🔧 ⬇
#> + vctrs              0.7.3  🔧 ⬇
#> + vroom              1.7.1  🔧 ⬇
#> + withr              3.0.3   ⬇
#> ℹ Getting 29 pkgs with unknown sizes
#> ✔ Cached copy of Lab5 0.1.0 (source) is the latest build
#> ✔ Got askpass 1.2.1 (aarch64-apple-darwin23) (25.30 kB)
#> ✔ Got clipr 0.8.1 (aarch64-apple-darwin23) (55.07 kB)
#> ✔ Got crayon 1.5.3 (aarch64-apple-darwin23) (166.32 kB)
#> ✔ Got hms 1.1.4 (aarch64-apple-darwin23) (104.17 kB)
#> ✔ Got curl 8.0.0 (aarch64-apple-darwin23) (1.22 MB)
#> ✔ Got bit 4.6.0 (aarch64-apple-darwin23) (745.22 kB)
#> ✔ Got httr 1.4.9 (aarch64-apple-darwin23) (479.88 kB)
#> ✔ Got lifecycle 1.0.5 (aarch64-apple-darwin23) (133.80 kB)
#> ✔ Got glue 1.8.1 (aarch64-apple-darwin23) (182.88 kB)
#> ✔ Got magrittr 2.0.5 (aarch64-apple-darwin23) (234.92 kB)
#> ✔ Got mime 0.13 (aarch64-apple-darwin23) (49.00 kB)
#> ✔ Got bit64 4.8.6 (aarch64-apple-darwin23) (658.17 kB)
#> ✔ Got cli 3.6.6 (aarch64-apple-darwin23) (1.49 MB)
#> ✔ Got pkgconfig 2.0.3 (aarch64-apple-darwin23) (18.45 kB)
#> ✔ Got R6 2.6.1 (aarch64-apple-darwin23) (88.14 kB)
#> ✔ Got sys 3.4.3 (aarch64-apple-darwin23) (52.51 kB)
#> ✔ Got pillar 1.11.1 (aarch64-apple-darwin23) (661.97 kB)
#> ✔ Got jsonlite 2.0.0 (aarch64-apple-darwin23) (1.11 MB)
#> ✔ Got tibble 3.3.1 (aarch64-apple-darwin23) (661.97 kB)
#> ✔ Got tidyselect 1.2.1 (aarch64-apple-darwin23) (226.62 kB)
#> ✔ Got utf8 1.2.6 (aarch64-apple-darwin23) (216.16 kB)
#> ✔ Got rlang 1.3.0 (aarch64-apple-darwin23) (1.94 MB)
#> ✔ Got readr 2.2.0 (aarch64-apple-darwin23) (1.98 MB)
#> ✔ Got withr 3.0.3 (aarch64-apple-darwin23) (225.06 kB)
#> ✔ Got tzdb 0.5.0 (aarch64-apple-darwin23) (1.32 MB)
#> ✔ Got openssl 2.4.2 (aarch64-apple-darwin23) (4.05 MB)
#> ✔ Got vctrs 0.7.3 (aarch64-apple-darwin23) (2.67 MB)
#> ✔ Got vroom 1.7.1 (aarch64-apple-darwin23) (3.26 MB)
#> ✔ Installed Lab5 0.1.0 (github::albba064/Lab5@2f7dfa1) (86ms)
#> ✔ Installed askpass 1.2.1  (87ms)
#> ✔ Installed bit 4.6.0  (89ms)
#> ✔ Installed bit64 4.8.6  (88ms)
#> ✔ Installed cli 3.6.6  (88ms)
#> ✔ Installed clipr 0.8.1  (88ms)
#> ✔ Installed crayon 1.5.3  (112ms)
#> ✔ Installed curl 8.0.0  (127ms)
#> ✔ Installed glue 1.8.1  (30ms)
#> ✔ Installed hms 1.1.4  (30ms)
#> ✔ Installed httr 1.4.9  (28ms)
#> ✔ Installed jsonlite 2.0.0  (31ms)
#> ✔ Installed lifecycle 1.0.5  (30ms)
#> ✔ Installed magrittr 2.0.5  (36ms)
#> ✔ Installed mime 0.13  (32ms)
#> ✔ Installed openssl 2.4.2  (40ms)
#> ✔ Installed pillar 1.11.1  (38ms)
#> ✔ Installed pkgconfig 2.0.3  (30ms)
#> ✔ Installed R6 2.6.1  (29ms)
#> ✔ Installed readr 2.2.0  (63ms)
#> ✔ Installed rlang 1.3.0  (35ms)
#> ✔ Installed sys 3.4.3  (37ms)
#> ✔ Installed tibble 3.3.1  (38ms)
#> ✔ Installed tidyselect 1.2.1  (33ms)
#> ✔ Installed tzdb 0.5.0  (33ms)
#> ✔ Installed utf8 1.2.6  (31ms)
#> ✔ Installed vctrs 0.7.3  (33ms)
#> ✔ Installed withr 3.0.3  (17ms)
#> ✔ Installed vroom 1.7.1  (117ms)
#> ✔ 1 pkg + 28 deps: upd 1, added 28, dld 28 (24.02 MB) [7.3s]
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

head(data)
#> # A tibble: 6 × 5
#>   time                latitude longitude   mag place                            
#>   <dttm>                 <dbl>     <dbl> <dbl> <chr>                            
#> 1 2026-10-04 14:06:10     5.37     -82.7   5   295 km S of Burica, Panama       
#> 2 2026-10-04 11:43:23    37.7       36.1   5   21 km ESE of Feke, Turkey        
#> 3 2026-10-04 11:12:48    22.8      145.    5.1 Volcano Islands, Japan region    
#> 4 2026-10-04 10:13:07    -8.27     120.    5   37 km N of Ruteng, Indonesia     
#> 5 2026-10-03 23:37:34     4.82      95.2   5.3 81 km SSW of Banda Aceh, Indones…
#> 6 2026-10-03 22:55:55    -9.57     119.    5.9 39 km WSW of Tambolaka, Indonesia
```
