
PublicBaths2 <- function(){

    library(leaflet)
    bathLongLat <- data.frame(lat = c(59.314957), lng = c(18.030238))

    map <- leaflet(bathLongLat)
    map <- addTiles(map, urlTemplate = "http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png")
    map <- addMarkers(map)

    library(htmlwidgets)
    saveWidget(map, "PublicBaths.html", selfcontained = TRUE)
}

