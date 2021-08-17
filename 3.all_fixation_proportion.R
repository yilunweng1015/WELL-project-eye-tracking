## load files 
filename <- "well_001_all"
path <- getwd()
Inputdir <- paste(path,"/",filename,".csv",sep = "")
t <- read.csv(Inputdir, header = TRUE,sep = ",", fill = TRUE, stringsAsFactors = FALSE, na.strings = "NA")
#t <- Data[which(Data$trial==1),]
lengt <- length(t$trial)

## calculate proportion of fixations across three conditions
for (i in 1:lengt) {
  if (t$time[i] < 50) {
    t$fix_pro_timewindow[i] = 0
  } else if (t$time[i] > 50 && t$time[i] < 50*2) {
    t$fix_pro_timewindow[i] = 50
  } else if (t$time[i] > 50*2 && t$time[i] < 50*3) {
    t$fix_pro_timewindow[i] = 100
  } else if (t$time[i] > 50*3 && t$time[i] < 50*4) {
    t$fix_pro_timewindow[i] = 150
  } else if (t$time[i] > 50*4 && t$time[i] < 50*5) {
    t$fix_pro_timewindow[i] = 200
  } else if (t$time[i] > 50*5 && t$time[i] < 50*6) {
    t$fix_pro_timewindow[i] = 250
  } else if (t$time[i] > 50*6 && t$time[i] < 50*7) {
    t$fix_pro_timewindow[i] = 300
  } else if (t$time[i] > 50*7 && t$time[i] < 50*8) {
    t$fix_pro_timewindow[i] = 350
  } else if (t$time[i] > 50*8 && t$time[i] < 50*9) {
    t$fix_pro_timewindow[i] = 400
  } else if (t$time[i] > 50*9 && t$time[i] < 50*10) {
    t$fix_pro_timewindow[i] = 450
  } else if (t$time[i] > 50*10 && t$time[i] < 50*11) {
    t$fix_pro_timewindow[i] = 500
  } else if (t$time[i] > 50*11 && t$time[i] < 50*12) {
    t$fix_pro_timewindow[i] = 550
  } else if (t$time[i] > 50*12 && t$time[i] < 50*13) {
    t$fix_pro_timewindow[i] = 600
  } else if (t$time[i] > 50*13 && t$time[i] < 50*14) {
    t$fix_pro_timewindow[i] = 650
  } else if (t$time[i] > 50*14 && t$time[i] < 50*15) {
    t$fix_pro_timewindow[i] = 700
  } else if (t$time[i] > 50*15 && t$time[i] < 50*16) {
    t$fix_pro_timewindow[i] = 750
  } else if (t$time[i] > 50*16 && t$time[i] < 50*17) {
    t$fix_pro_timewindow[i] = 800
  } else if (t$time[i] > 50*17 && t$time[i] < 50*18) {
    t$fix_pro_timewindow[i] = 850
  } else if (t$time[i] > 50*18 && t$time[i] < 50*19) {
    t$fix_pro_timewindow[i] = 900
  } else if (t$time[i] > 50*19 && t$time[i] < 50*20) {
    t$fix_pro_timewindow[i] = 950
  } else if (t$time[i] > 50*20 && t$time[i] < 50*21) {
    t$fix_pro_timewindow[i] = 1000
  } else if (t$time[i] > 50*21 && t$time[i] < 50*22) {
    t$fix_pro_timewindow[i] = 1050
  } else if (t$time[i] > 50*22 && t$time[i] < 50*23) {
    t$fix_pro_timewindow[i] = 1100
  } else if (t$time[i] > 50*23 && t$time[i] < 50*24) {
    t$fix_pro_timewindow[i] = 1150
  } else if (t$time[i] > 50*24 && t$time[i] < 50*25) {
    t$fix_pro_timewindow[i] = 1200
  } else if (t$time[i] > 50*25 && t$time[i] < 50*26) {
    t$fix_pro_timewindow[i] = 1250
  } else if (t$time[i] > 50*26 && t$time[i] < 50*27) {
    t$fix_pro_timewindow[i] = 1300
  } else if (t$time[i] > 50*27 && t$time[i] < 50*28) {
    t$fix_pro_timewindow[i] = 1350
  } else if (t$time[i] > 50*28 && t$time[i] < 50*29) {
    t$fix_pro_timewindow[i] = 1400
  } else if (t$time[i] > 50*29 && t$time[i] < 50*30) {
    t$fix_pro_timewindow[i] = 1450
  } else if (t$time[i] > 50*30 && t$time[i] < 50*31) {
    t$fix_pro_timewindow[i] = 1500
  } else if (t$time[i] > 50*31 && t$time[i] < 50*32) {
    t$fix_pro_timewindow[i] = 1550
  } else if (t$time[i] > 50*32 && t$time[i] < 50*33) {
    t$fix_pro_timewindow[i] = 1600
  } else if (t$time[i] > 50*33 && t$time[i] < 50*34) {
    t$fix_pro_timewindow[i] = 1650
  } else if (t$time[i] > 50*34 && t$time[i] < 50*35) {
    t$fix_pro_timewindow[i] = 1700
  } else if (t$time[i] > 50*35 && t$time[i] < 50*36) {
    t$fix_pro_timewindow[i] = 1750
  } else if (t$time[i] > 50*36 && t$time[i] < 50*37) {
    t$fix_pro_timewindow[i] = 1800
  } else if (t$time[i] > 50*37 && t$time[i] < 50*38) {
    t$fix_pro_timewindow[i] = 1850
  } else if (t$time[i] > 50*38 && t$time[i] < 50*39) {
    t$fix_pro_timewindow[i] = 1900
  } else if (t$time[i] > 50*39 && t$time[i] < 50*40) {
    t$fix_pro_timewindow[i] = 1950
  } else if (t$time[i] > 50*40 && t$time[i] < 50*41) {
    t$fix_pro_timewindow[i] = 2000
  } else if (t$time[i] > 50*41 && t$time[i] < 50*42) {
    t$fix_pro_timewindow[i] = 2050
  } else if (t$time[i] > 50*42 && t$time[i] < 50*43) {
    t$fix_pro_timewindow[i] = 2100
  } else if (t$time[i] > 50*43 && t$time[i] < 50*44) {
    t$fix_pro_timewindow[i] = 2150
  } else if (t$time[i] > 50*44 && t$time[i] < 50*45) {
    t$fix_pro_timewindow[i] = 2200
  } else if (t$time[i] > 50*45 && t$time[i] < 50*46) {
    t$fix_pro_timewindow[i] = 2250
  } else if (t$time[i] > 50*46 && t$time[i] < 50*47) {
    t$fix_pro_timewindow[i] = 2300
  } else if (t$time[i] > 50*47 && t$time[i] < 50*48) {
    t$fix_pro_timewindow[i] = 2350
  } else if (t$time[i] > 50*48 && t$time[i] < 50*49) {
    t$fix_pro_timewindow[i] = 2400
  } else if (t$time[i] > 50*49 && t$time[i] < 50*50) {
    t$fix_pro_timewindow[i] = 2450
  } else if (t$time[i] > 50*50 && t$time[i] < 50*51) {
    t$fix_pro_timewindow[i] = 2500
  } else if (t$time[i] > 50*51 && t$time[i] < 50*52) {
    t$fix_pro_timewindow[i] = 2550
  } else if (t$time[i] > 50*52 && t$time[i] < 50*53) {
    t$fix_pro_timewindow[i] = 2600
  } else if (t$time[i] > 50*53 && t$time[i] < 50*54) {
    t$fix_pro_timewindow[i] = 2650
  } else if (t$time[i] > 50*54 && t$time[i] < 50*55) {
    t$fix_pro_timewindow[i] = 2700
  } else if (t$time[i] > 50*55 && t$time[i] < 50*56) {
    t$fix_pro_timewindow[i] = 2750
  } else if (t$time[i] > 50*56 && t$time[i] < 50*57) {
    t$fix_pro_timewindow[i] = 2800
  } else if (t$time[i] > 50*57 && t$time[i] < 50*58) {
    t$fix_pro_timewindow[i] = 2850
  } else if (t$time[i] > 50*58 && t$time[i] < 50*59) {
    t$fix_pro_timewindow[i] = 2900
  } else if (t$time[i] > 50*59 && t$time[i] < 50*60) {
    t$fix_pro_timewindow[i] = 2950
  } else if (t$time[i] > 50*60 && t$time[i] < 50*61) {
    t$fix_pro_timewindow[i] = 3000
  } else if (t$time[i] > 50*61 && t$time[i] < 50*62) {
    t$fix_pro_timewindow[i] = 3050
  } else if (t$time[i] > 50*62 && t$time[i] < 50*63) {
    t$fix_pro_timewindow[i] = 3100
  } else if (t$time[i] > 50*63 && t$time[i] < 50*64) {
    t$fix_pro_timewindow[i] = 3150
  } else if (t$time[i] > 50*64 && t$time[i] < 50*65) {
    t$fix_pro_timewindow[i] = 3200
  } else if (t$time[i] > 50*65 && t$time[i] < 50*66) {
    t$fix_pro_timewindow[i] = 3250
  } else if (t$time[i] > 50*66 && t$time[i] < 50*67) {
    t$fix_pro_timewindow[i] = 3300
  } else if (t$time[i] > 50*67 && t$time[i] < 50*68) {
    t$fix_pro_timewindow[i] = 3350
  } else if (t$time[i] > 50*68 && t$time[i] < 50*69) {
    t$fix_pro_timewindow[i] = 3400
  } else if (t$time[i] > 50*69 && t$time[i] < 50*70) {
    t$fix_pro_timewindow[i] = 3450
  } else if (t$time[i] > 50*70 && t$time[i] < 50*71) {
    t$fix_pro_timewindow[i] = 3500
  } else if (t$time[i] > 50*71 && t$time[i] < 50*72) {
    t$fix_pro_timewindow[i] = 3550
  } else if (t$time[i] > 50*72 && t$time[i] < 50*73) {
    t$fix_pro_timewindow[i] = 3600
  } else if (t$time[i] > 50*73 && t$time[i] < 50*74) {
    t$fix_pro_timewindow[i] = 3650
  } else if (t$time[i] > 50*74 && t$time[i] < 50*75) {
    t$fix_pro_timewindow[i] = 3700
  } else if (t$time[i] > 50*75 && t$time[i] < 50*76) {
    t$fix_pro_timewindow[i] = 3750
  } else if (t$time[i] > 50*76 && t$time[i] < 50*77) {
    t$fix_pro_timewindow[i] = 3800
  } else if (t$time[i] > 50*77 && t$time[i] < 50*78) {
    t$fix_pro_timewindow[i] = 3850
  } else if (t$time[i] > 50*78 && t$time[i] < 50*79) {
    t$fix_pro_timewindow[i] = 3900
  } else if (t$time[i] > 50*79 && t$time[i] < 50*80) {
    t$fix_pro_timewindow[i] = 3950
  } else if (t$time[i] > 50*80) {
    t$fix_pro_timewindow[i] = 4000
  } else {
  }
}


## Delete fillers
Data <- subset(t, cond1!="filler")


library(dplyr)
## Identify looking object
Data <- Data %>%
  mutate(eye_object = ifelse(TA == eyeloc, "ta", ifelse(
    TI == eyeloc, "ti", ifelse(DA == eyeloc, "da", "di")))) %>%
  as.data.frame()

names(Data)[11] <- "cond"

#Make a dataframe with just few columns 
#Data1 <- subset(Data, cond!="filler" & cond!="insttrain" & cond!="modtrain" & cond!="pre_test" & cond!="unpredictable"& cond!="predictable")
Data1 <- subset(Data, cond!="filler")

Data2 <- Data1 %>%
  select(trial, subject, cond, fix_pro_timewindow, eye_object)

Data3 <- Data2 %>% group_by(cond,fix_pro_timewindow) %>% count(eye_object)
Data3 <- Data3 %>% group_by(cond,fix_pro_timewindow) %>% mutate(total=sum(n))
Data3 <- subset(Data3, total>3)
Data3_sum <- Data3 %>% group_by(cond,fix_pro_timewindow) %>% mutate(Percentage=paste0(round(n/sum(n),2)))

Data3_sum$subject <- "well_001"
write.csv(Data3_sum, file = "well_001_fixation_proportion.csv", row.names=T)


#### Combine all subjects' data together
library(rio)
library(dplyr)
library(Rmisc)
data_all <- list.files(pattern = "*.csv", full.names = TRUE) %>% 
  lapply(read.csv) %>%                                          
  bind_rows    

df <- data_all %>%
  select(cond, fix_pro_timewindow, eye_object, subject, Percentage)

df$Percentage <- as.numeric(sub("%", "",df$Percentage,fixed=TRUE))/100
df_sum <- summarySE(df, measurevar="Percentage", groupvars=c("fix_pro_timewindow","cond","eye_object"))
write.csv(df_sum, file = "well_eye_fixation_proportion_all.csv",row.names=T)
