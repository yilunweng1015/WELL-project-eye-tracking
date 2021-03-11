rm(list = ls())
library(tidyverse)
library(plyr)
library(dplyr)
library(psych)
library(ggplot2)

## Load files
filename1 <- "well_pilot_001"
path <- getwd()
Inputdir <- paste(path,"/",filename1,".csv",sep = "")
Data <- read.csv(Inputdir, header = TRUE,sep = ",", fill = TRUE, stringsAsFactors = FALSE, na.strings = "NA")


## Delete fillers and practice trials
Data <- subset(Data, Condition!="filler")

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

write.csv(subdata2,file = "well_p_001_firstfix.csv",row.names=T)
