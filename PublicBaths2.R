
PublicBaths2 <- function(){

    library(leaflet)
    sthlmStadIcon <- makeIcon(iconUrl = "https://upload.wikimedia.org/wikipedia/commons/thumb/4/4d/Stockholm_vapen_bra.svg/196px-Stockholm_vapen_bra.svg.png", iconWidth = 31*215/230, iconHeight = 31, iconAnchorX = 31*215/230/2, iconAnchorY = 16)

    bathLongLat <- data.frame(lat = c(59.314957, 59.305137, 59.314591, 59.347463, 59.330983), lng = c(18.030238, 18.074779, 18.072579, 18.078571, 18.037438))

    bathWebSites <- c("<a href = 'http://www.stockholm.se/-/Serviceenhetsdetaljer/?enhet=add732997ff64fd6b7b86c7ecdb1e9c4' > Liljeholmsbadet</a>",
                  "<a href = 'http://www.stockholm.se/-/Serviceenhetsdetaljer/?enhet=573ebb2ab506457594df76b9873cae5d' > Eriksdalsbadet</a>", 
                  "<a href = 'http://www.stockholm.se/-/Serviceenhetsdetaljer/?enhet=64624ed6c4914576b0ebdb377b659d6a' > Forsgrenska badet</a>", 
                  "<a href = 'http://www.stockholm.se/-/Serviceenhetsdetaljer/?enhet=316f268f02b7459f9d374da8493aa316' > GIH-badet</a>", 
                  "<a href = 'http://www.stockholm.se/-/Serviceenhetsdetaljer/?enhet=90a65061e1444521bc0b660c01fe3f58' > Kronobergsbadet</a>")

    bathLongLat %>% 
            leaflet() %>%
            addTiles(urlTemplate = "http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png") %>%
            addMarkers(icon = sthlmStadIcon, popup = bathWebSites)

    map <- leaflet(bathLongLat)
    map <- addTiles(map, urlTemplate = "http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png")
    map <- addMarkers(map, icon = sthlmStadIcon, popup = bathWebSites)

    library(htmlwidgets)
    saveWidget(map, "PublicBathsFromWidget.html", selfcontained = TRUE)
}

