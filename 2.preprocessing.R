rm(list = ls())
library(tidyverse)
library(plyr)
library(dplyr)
library(psych)
library(ggplot2)

## Load files
filename1 <- "well_004_all"
path <- getwd()
Inputdir <- paste(path,"/",filename1,".csv",sep = "")
data <- read.csv(Inputdir, header = TRUE,sep = ",", fill = TRUE, stringsAsFactors = FALSE, na.strings = "NA")


## Delete fillers
Data <- subset(data, cond1!="filler")

## Identify looking object
Data <- Data %>%
  mutate(eye_object = ifelse(TA == eyeloc, "ta", ifelse(
    TI == eyeloc, "ti", ifelse(DA == eyeloc, "da", "di")))) %>%
  as.data.frame()


## Find the first look
Data$first <- NA
datalength <- length(Data$trial)

for (i in 1:datalength) {
  if (Data$eye_object[i] == Data$eye_object[i+1]) {
    Data$first[i+1] = 0
  } else {Data$first[i+1] = 1}
}

subdata <- subset(Data, first!=0)
subdata$look1 <- NA
datalen <- length(subdata$trial)
subdata$look1[1] <- 0

for (i in 1:datalen) {
  subdata$look1[i] = subdata$time[i+1] - subdata$time[i]
}

subdata1 <- subset(subdata, time > 200)
subdata2 <- subset(subdata, look1 >= 200)
subdata3 <- subdata2[!duplicated(subdata2$trial),]


write.csv(subdata3,file = "well_004_firstfix.csv",row.names=T)
