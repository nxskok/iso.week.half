
<!-- README.md is generated from README.Rmd. Please edit that file -->

# iso.week.half

<!-- badges: start -->

<!-- badges: end -->

The goal of iso.week.half is to obtain a week number for a date, with an
additional 0.5 for a date on Tuesday, Wednesday or Thursday.

## Installation

From Github:

``` r
devtools::install_github("nxskok/iso.week.half")
```

## Example

``` r
library(iso.week.half)
iso_week_half(as.Date("2020-07-03"))
#> [1] 27
iso_week_half(as.Date("2020-07-02"))
#> [1] 26.5
```

in 2020, July 2 was in a different half-week because it was on a
Thursday.

## `base_year`

By default, the base year is 2020. If you have dates from other years,
the week numbers will look funny. Set the base year accordingly if that
bothers you:

``` r
iso_week_half(as.Date("2019-07-03"))
#> [1] -26.5
iso_week_half(as.Date("2021-07-02"))
#> [1] 79
```

and then

``` r
iso_week_half(as.Date("2019-07-03"), 2019)
#> [1] 26.5
iso_week_half(as.Date("2021-07-02"), 2021)
#> [1] 26
```

The advantage to doing it this way is that the week numbers from
different years will order properly:

``` r
iso_week_half(as.Date("2017-09-03"))
#> [1] -124
iso_week_half(as.Date("2018-07-02"))
#> [1] -80
iso_week_half(as.Date("2019-05-03"))
#> [1] -35
iso_week_half(as.Date("2020-04-12"))
#> [1] 15
```

## Vectors

``` r
dates <- seq(Sys.Date(), by = -1, length.out = 10)
tibble::tibble(date=dates, dow=lubridate::wday(dates, label=TRUE), week=iso_week_half(dates))
#> # A tibble: 10 x 3
#>    date       dow    week
#>    <date>     <ord> <dbl>
#>  1 2020-07-03 Fri    27  
#>  2 2020-07-02 Thu    26.5
#>  3 2020-07-01 Wed    26.5
#>  4 2020-06-30 Tue    26.5
#>  5 2020-06-29 Mon    26  
#>  6 2020-06-28 Sun    26  
#>  7 2020-06-27 Sat    26  
#>  8 2020-06-26 Fri    26  
#>  9 2020-06-25 Thu    25.5
#> 10 2020-06-24 Wed    25.5
```
