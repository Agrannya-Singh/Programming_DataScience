# ─────────────────────────────────────────────────────────────────
# Author: Agrannya Singh | Reg No: 23BCE0965
# Lab 48 | Creating Interactive Maps Using the Leaflet Package
# Course : BCSE207P — Programming for Data Science
# Faculty : Dr. M Rajasekhara Babu
# ─────────────────────────────────────────────────────────────────

# ── Step 1: Install and Load the Leaflet Package ─────────────────
# install.packages("leaflet")     # uncomment and run once
library(leaflet)                   # loads leaflet for interactive map creation

# ── Step 2: Initialise Map and Set Geographic View ───────────────
# leaflet()  → creates an empty HTML widget canvas
# addTiles()  → applies the default OpenStreetMap base layer
# setView()  → centres the viewport at Katpadi (VIT); zoom = 10
map1 <- leaflet() %>%
  addTiles() %>%
  setView(lng  = 80.1309,         # longitude: Katpadi, Tamil Nadu
          lat  = 12.9699,         # latitude: Katpadi, Tamil Nadu
          zoom = 10)              # zoom level 10 — city-scale view

# Render the base map to confirm tiles load correctly
map1

# ── Step 3: Add a Standard Marker with a Popup ───────────────────
# addMarkers() drops a default pin at the given coordinates.
# The popup argument provides an HTML string; it appears as a
# speech-bubble tooltip when the user clicks the marker.
map2 <- map1 %>%
  addMarkers(lng   = 80.1309,
             lat   = 12.9699,
             popup = "Hello from Katpadi!")

# Render the map with the drop-pin marker
map2

# ── Step 4: Add a Customised Circle Marker ───────────────────────
# addCircleMarkers() renders a styled circle instead of a default pin.
# color  → stroke / fill colour of the circle
# radius → size of the circle in screen pixels (not geographic units)
# label  → persistent text tooltip visible on mouse hover
map3 <- map2 %>%
  addCircleMarkers(lng   = 80.2,       # slight eastward offset from pin
                   lat   = 12.95,      # slight southward offset from pin
                   color = "red",
                   radius = 8,
                   label = "This is a circle marker!")

# Render the final map with both the pin and the circle marker
map3
