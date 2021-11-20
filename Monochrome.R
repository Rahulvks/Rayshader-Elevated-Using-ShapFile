library(elevatr)
library(rayshader)
library(sf)


#Ind
isrfull <- read_sf(Input Shape File)


isrfull <- st_transform(isrfull, 4326)
isrraster <- get_elev_raster(locations = isrfull,z=7 ,clip = "locations")
isrrayshader = raster_to_matrix(isrraster)
isrrayshader %>% 
  sphere_shade(texture = "bw") %>% 
  plot_3d(isrrayshader, zscale = 10, fov = 0, theta = 0, zoom = 0.9, phi = 45, windowsize = c(1000, 800),
          water = TRUE, watercolor="imhof2", 
          waterlinecolor="white", waterlinealpha=0.5)


render_snapshot("Output path",
                title_text = "India's\nElevation",
                title_offset = c(60,50),
                title_color = "black",
                title_size = 40,
                title_font = "PT Serif",
                vignette = 0.1)
