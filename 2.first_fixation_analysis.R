rm(list = ls())
library(tidyverse)
library(plyr)
library(dplyr)
library(psych)
library(ggplot2)

#### Find out the first fixation for single participant
## Load files
filename1 <- "well_001_all"
path <- getwd()
Inputdir <- paste(path,"/",filename1,".csv",sep = "")
data <- read.csv(Inputdir, header = TRUE,sep = ",", fill = TRUE, stringsAsFactors = FALSE, na.strings = "NA")


## Delete fillers
Data <- subset(data, cond!="filler")

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

write.csv(subdata3,file = "well_001_firstfix.csv",row.names=T)




#### Proportion of first fixation - all participants
library(dplyr)
data <- list.files(pattern = "*.csv", full.names = TRUE) %>% 
  lapply(read.csv) %>%                                            # fix_pred_prop.csv files
  bind_rows    

#### Verb bias task
data_all <- subset(data, cond!="unpredictable" & cond!="predictable"& cond!="insttrain"& cond!="modtrain")

df <- data_all %>%
  select(cond, eye_object, subject)
df1 <- df %>%
  mutate(eye_object2 = ifelse(eye_object == "ta", "animal", ifelse(
    eye_object == "da", "animal", ifelse(eye_object == "ti", "instrument", "instrument")))) %>%
  as.data.frame()
df_count <- df1 %>% group_by(cond, eye_object2, subject) %>% count(eye_object2)
df_sum <- df_count %>% group_by(cond,subject) %>% mutate(Percentage=paste0(round(n/sum(n),2)))

write.csv(df_sum, file = "well_firstfix_vb_proportion_allsub.csv",row.names=T)

####
data_all <- subset(data, cond=="unpredictable"|cond=="predictable")

df <- data_all %>%
  select(cond, eye_object, subject,trial)
df1 <- df %>%
  mutate(eye_object2 = ifelse(eye_object == "ta", "relevant animal", ifelse(
    eye_object == "da", "irrelevant animal", ifelse(eye_object == "ti", "relevant instrument", "irrelevant instrument")))) %>%
  as.data.frame()

df_count <- df1 %>% group_by(cond, eye_object2, subject) %>% count(eye_object2)
df_sum <- df_count %>% group_by(cond,subject) %>% mutate(Percentage=paste0(round(n/sum(n),2)))
write.csv(df_sum, file = "well_firstfix_pred_proportion_allsub.csv",row.names=T)
