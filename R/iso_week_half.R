#' Week number of date, plus a half if midweek
#'
#' @param date a date
#' @param base_year adds 53 weeks for each year since base year
#'
#' @return a (double) week number, with extra half if Tuesday, Wednesday or Thursday
#'
#' @examples
#' iso_week_half(as.Date("2020-07-03"))
#' iso_week_half(as.Date("2020-07-02"))
#'
#' @export
iso_week_half <- function(date, base_year=2019) {
  iw <- lubridate::isoweek(date-lubridate::days(1))
  dow <- lubridate::wday(date, label=T)
  ym <- lubridate::year(date)-base_year
  iw <- ifelse(dow %in% c("Tue", "Wed", "Thu"), iw-0.5, iw)
  iw+ym*53
}
