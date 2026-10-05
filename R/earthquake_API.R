

earthquake_API <- function(format = "csv",
                           starttime = "2026-10-01",
                           endtime = "2026-10-05",
                           min_magnitude = 6){

  #check that start-and endtime can be coerced into class "DATE" and that min_magnitude is numeric and finite
  if (is.na(as.Date(as.character(starttime), tz = 'UTC', format = '%Y-%m-%d')) |
      is.na(as.Date(as.character(endtime), tz = 'UTC', format = '%Y-%m-%d'))){
    stop("Invalid date format")
  } else if(!is.numeric(min_magnitude)){
    stop("min_magnitude must be numeric")
  }
  parameters <- paste0("?format=", format,
                       "&starttime=",starttime,
                       "&endtime=", endtime,
                       "&minmagnitude=", min_magnitude)

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
    stop(paste("API returned not 200 status code: ", pull$status_code))
  }


  response_as_text <- httr::content(pull, as = "text")

  df <- readr::read_csv(
    file = response_as_text,
    col_names = TRUE,
    col_select = c("time", "latitude", "longitude", "mag", "place"),
    show_col_types = FALSE)


}
test <- earthquake_API(starttime = "2026-09-30", endtime = "2026-10-01", min_magnitude = 0)
#test$time <- as.character(test$time)
test_sf <- sf::st_as_sf(test, coords = c("latitude", "longitude"))

leaflet::leaflet(data = test) |> leaflet::addTiles() |>
  leaflet::addCircleMarkers(lng = ~longitude, lat = ~latitude, radius = ~mag,
                            popup = ~paste0("<b>", place,"</b><br><b>Time</b>: ",as.character(time), "</b><br><b>Magnitude:</b> ", mag,"</b>"))
richter_colors <- c(
  "#2ECC71",  # 0–1: very low
  "#A3D977",  # 1–2
  "#F1E05A",  # 2–3
  "#F5B041",  # 3–4
  "#E67E22",  # 4–5
  "#E74C3C",  # 5–6
  "#C0392B",  # 6–7
  "#8E2C2C",  # 7–8
  "#5B1A1A"   # 8+: extreme
)

richter_colors <- c(
  "#2ECC71",  # low magnitude
  "#A3D977",
  "#F1E05A",
  "#F5B041",
  "#E67E22",
  "#E74C3C",
  "#C0392B",
  "#8E2C2C",
  "#5B1A1A"   # high magnitude
)

mag_pal <- leaflet::colorBin(
  palette = richter_colors,
  domain = test$mag,
  bins = c(0, 1, 2, 3, 4, 5, 6, 7, 8, Inf),
  na.color = "#808080"
)

leaflet::leaflet(data = test) |>
  leaflet::addTiles() |>
  leaflet::addProviderTiles("Stadia.AlidadeSmoothDark") |>
  leaflet::addCircleMarkers(
    lng = ~longitude,
    lat = ~latitude,
    radius = ~mag,
    fillColor = ~mag_pal(mag),
    color = ~mag_pal(mag),
    fillOpacity = 0.8,
    weight = 1,
    popup = ~paste0(
      "<b>", place, "</b><br>",
      "<b>Time:</b> ", as.character(time), "<br>",
      "<b>Magnitude:</b> ", mag
    )
  ) |>
  leaflet::addLegend(
    "bottomright",
    pal = mag_pal,
    values = ~mag,
    title = "Magnitude",
    opacity = 0.8
  )
