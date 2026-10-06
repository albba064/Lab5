#' Access the USGS Eartchquake API
#' @param starttime Limit to events on or after the specified
#' end start Enter character string "YYYY-MM-DD"
#' @param endtime Limit to events on or before the specified
#' end time. Enter character string "YYYY-MM-DD"
#' @param min_magnitude Limit to events with a magnitude
#' larger than the specified minimum, numeric
#' @param max_magnitude Limit to events with a magnitude smaller
#' than the specified maximum, numeric
#'
#' @return a data.frame containing time, latitude, longitude,
#' magnitude and location name of events
#'
#' @import httr2
#' @import readr
#' @export
earthquake_API <- function(starttime = "2026-10-01",
                           endtime = "2026-10-05",
                           min_magnitude = -1,
                           max_magnitude = 15) {
  # check that start-and endtime can be coerced into class
  # "DATE" and that min_magnitude is numeric and finite
  if (is.na(as.Date(as.character(starttime), tz = "UTC", format = "%Y-%m-%d")) ||
    is.na(as.Date(as.character(endtime), tz = "UTC", format = "%Y-%m-%d"))) {
    stop("Invalid date format")
  } else if (as.Date(as.character(starttime), tz = "UTC", format = "%Y-%m-%d") >
    as.Date(as.character(endtime), tz = "UTC", format = "%Y-%m-%d")) {
    stop("starttime must be after endtime")
  } else if (!is.numeric(c(min_magnitude, max_magnitude))) {
    stop("min_magnitude, max_magnitude must be numeric")
  }

  url <- "https://earthquake.usgs.gov/fdsnws/event/1/"


  num_events <- httr2::request(paste0(url, "count")) |>
    httr2::req_url_query(
      starttime = starttime,
      endtime = endtime,
      minmagnitude = min_magnitude,
      maxmagnitude = max_magnitude
    ) |>
    httr2::req_perform() |>
    httr2::resp_check_status() |>
    httr2::resp_body_string() |>
    as.numeric()

  if (num_events > 20000) {
    stop("So many events requested! USGS API has a limit of 20,000 events")
  }

  response <- httr2::request(paste0(url, "query")) |>
    httr2::req_url_query(
      format = "csv",
      starttime = starttime,
      endtime = endtime,
      minmagnitude = min_magnitude,
      maxmagnitude = max_magnitude
    ) |>
    httr2::req_perform() |>
    httr2::resp_check_status()

  # Convert response to data frame
  df <- readr::read_csv(
    httr2::resp_body_string(response),
    col_names = TRUE,
    col_select = c("time", "latitude", "longitude", "mag", "place"),
    show_col_types = FALSE
  )
  return(df)
}
