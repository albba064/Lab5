
#' Access the USGS Eartchquake API
#' @param starttime Limit to events on or after the specified end start Enter character string "YYYY-MM-DD"
#' @param endtime Limit to events on or before the specified end time. Enter character string "YYYY-MM-DD"
#' @param min_magnitude Limit to events with a magnitude larger than the specified minimum, numeric
#' @param max_magnitude Limit to events with a magnitude smaller than the specified maximum, numeric
#'
#' @return a data.frame containing time, latitude, longitude, magnitude and location name of events
#'
#' @import httr
#' @import readr
#' @export
earthquake_API <- function(format = "csv",
                           starttime = "2026-10-01",
                           endtime = "2026-10-05",
                           min_magnitude = -1,
                           max_magnitude = 15){

  #check that start-and endtime can be coerced into class "DATE" and that min_magnitude is numeric and finite
  if (is.na(as.Date(as.character(starttime), tz = 'UTC', format = '%Y-%m-%d')) ||
      is.na(as.Date(as.character(endtime), tz = 'UTC', format = '%Y-%m-%d'))){
    stop("Invalid date format")
  } else if(!is.numeric(c(min_magnitude, max_magnitude))){
    stop("min_magnitude, max_magnitude must be numeric")
  }
  parameters <- paste0("?format=", format,
                       "&starttime=",starttime,
                       "&endtime=", endtime,
                       "&minmagnitude=", min_magnitude,
                       "&maxmagnitude=", max_magnitude)

  url <- "https://earthquake.usgs.gov/fdsnws/event/1/"


  count <- as.numeric(httr::content(httr::GET(paste0(url, "count", parameters))))

  if (count > 20000) {
    stop(paste("So many events requested! USGS API has limit of 20 000 events"))
  }

  # full request URL
  url_request <- paste0(url, "query", parameters)

  # get request from url
  pull <- httr::GET(url_request)

  # check if successful response code
  if (pull$status_code != 200) {
    stop(paste("API did not return successful response code: ", pull$status_code))
  }


  response_as_text <- httr::content(pull, as = "text")

  df <- readr::read_csv(
    file = response_as_text,
    col_names = TRUE,
    col_select = c("time", "latitude", "longitude", "mag", "place"),
    show_col_types = FALSE)


}

