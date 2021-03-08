rm(list = ls())
library("devtools")
install_github("tmalsburg/saccades/saccades", dependencies=TRUE)
library('tidyverse')
library('saccades')
library('ggplot2')
library('png')
library("MASS")

##### load files #####
filename1 <- "well_001_t1"
path <- getwd()
Inputdir <- paste(path,"/",filename1,".csv",sep = "")
Data <- read.csv(Inputdir, header = TRUE,sep = ",", fill = TRUE, stringsAsFactors = FALSE, na.strings = "NA")

#Drop rows that are not predictions 
preds <- Data[grepl("prediction", Data$type),]


#Make dataframe with just Time, X, Y and Trial columns 
preds_minimal <- preds %>%
  select(time_elapsed, x_pred_normalised, y_pred_normalised, screen_index)
preds_minimal <- preds_minimal %>%
  rename(time = time_elapsed, x = x_pred_normalised, y = y_pred_normalised, trial = screen_index) 

#Add subject ID
preds_minimal$subject <- c("well_001")

#Visualize trials
ggplot(preds_minimal, aes(x, y)) +
  geom_point(size=0.8) +
  coord_fixed()

#We need to align it with our eye coordinate space
zone <- Data[grepl("Zone2", Data$zone_name),] # Zone2 is the image zone 

#Extract coordinate info 
orig_x <- zone$zone_x_normalised
orig_y <- zone$zone_y_normalised
width <- zone$zone_width_normalised
height <- zone$zone_height_normalised


#Align it with the stimuli we had placed
img <- readPNG('1.png') # the image 

#Add this image using ggplot2 annotation raster with coordinates calculated for the image
ggplot(preds_minimal, aes(x, y)) +
  xlim(-0.1, 1) +
  ylim(0, 0.9) +
  #annotation_raster(img, xmin=orig_x, xmax=orig_x+width, ymin=orig_y, ymax=orig_y+height) +
  annotation_raster(img, xmin=-0.1, xmax=1.1, ymin=0, ymax=1) +
  geom_point()+
  #facet_wrap(~trial)+
  theme(
    panel.grid.major = element_blank(), 
    panel.grid.minor = element_blank(),
    panel.background = element_rect(fill = "transparent",colour = NA),
    plot.background = element_rect(fill = "transparent",colour = NA)) +
    #stat_density_2d(aes(fill = ..level..), geom = "polygon")
    scale_fill_gradient(low="green", high="red") +
    stat_density2d(aes(fill=..level.., alpha = ..level..), geom="polygon", bins = 5, size = 0.01)
    #geom_density_2d(size = 0.25, colour = "blue")


##
ggplot(a,aes(x=xp,y=yp)) +
  theme(strip.text.x = element_text(size = 16)) + 
  stat_density2d(aes(fill=..level.., alpha = ..level..), geom="polygon", bins = 5, size = 0.01) +
  scale_fill_gradient(low="green", high="red") +
  #geom_point(aes(col = condition)) +
  scale_x_continuous(limits = c(0, 1), breaks = c(0.2, 0.5, 0.8)) +
  scale_y_reverse( lim=c(1,0), breaks = c(0.2, 0.5, 0.8)) + 
  scale_alpha_continuous(range=c(0.1,0.8)) +
  geom_point(data = aa, aes(x = tx, y = ty), shape = 3, size = 3) +
  guides(fill = FALSE, group = FALSE, colour=FALSE, alpha = FALSE) +
  labs("y" = "position of target in % of screen height", "x" = "position of target in % of screen width")
dev.copy(png, 'tolcam_simple_heatmap.png', width=10, height=4, units="in", res=300)
dev.off()




#Detect fixations 
#fixations <- detect.fixations(preds_minimal)

# library(ggplot2)
# ggplot(data = preds_minimal,
#        aes(x = time)) + # define time series x axis
#   geom_line(aes(y = x), colour = 'red') +  # plot horizontal data
#   geom_line(aes(y = y), colour = 'blue') # plot vertical time series too

