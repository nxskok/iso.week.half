#' Week number of date, plus a half if midweek
#'
#' @param date a date
#'
#' @return a (double) week number, with extra half if Tuesday, Wednesday or Thursday
#'
#' @examples
#' iso_week_half(as.Date("2020-07-03"))
#' iso_week_half(as.Date("2020-07-02"))
#'
#' @export
iso_week_half <- function(date) {
  iw <- lubridate::isoweek(date-lubridate::days(1))
  dow <- lubridate::wday(date, label=T)
  # ym <- lubridate::year(date)-2019
  iw <- ifelse(dow %in% c("Tue", "Wed", "Thu"), iw-0.5, iw)
  # iw+ym*53
  iw
}
