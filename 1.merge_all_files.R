library(tidyverse)
library(tidyr)
library(rio)

# # Convert xlsx to csv format
# xls <- dir(pattern = "xlsx")
# created <- mapply(convert, xls, gsub("xlsx", "csv", xls)) # convert
# unlink(xls) # delete xlsx files

#file.rename(list.files(pattern="27846_*.csv"), paste0("well_001_", 1:184))


# Load and merge multiple csv files 
data_all <- list.files(pattern = "*.csv", full.names = TRUE) %>% 
  lapply(read_csv) %>%                                            # Store all files in list
  bind_rows                                                       # Combine data sets into one data set 
eyeinfo <- read.csv("~/Desktop/well_project/trial_info.csv")

#Drop rows that are not predictions 
preds <- data_all[grepl("prediction", data_all$type),]


#Make a dataframe with just Time, X, Y and Trial columns 
preds_minimal <- preds %>%
  select(time_elapsed, x_pred_normalised, y_pred_normalised, spreadsheet_row)

preds_minimal <- preds_minimal %>%
  rename(time = time_elapsed, x = x_pred_normalised, y = y_pred_normalised, trial = spreadsheet_row) 


#Add subject ID
preds_minimal$subject <- c("well_004")


#Change trial ID
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==4, 1)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==6, 2)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==8, 3)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==10, 4)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==12, 5)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==14, 6)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==16, 7)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==18, 8)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==20, 9)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==22, 10)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==24, 11)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==26, 12)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==28, 13)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==30, 14)

preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==32, 15)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==34, 16)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==36, 17)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==38, 18)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==40, 19)

preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==42, 20)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==44, 21)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==46, 22)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==48, 23)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==50, 24)

preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==52, 25)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==54, 26)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==56, 27)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==58, 28)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==60, 29)

preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==62, 30)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==64, 31)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==66, 32)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==68, 33)

preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==70, 34)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==72, 35)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==74, 36)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==76, 37)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==78, 38)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==80, 39)

preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==82, 40)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==84, 41)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==86, 42)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==88, 43)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==90, 44)

preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==92, 45)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==94, 46)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==96, 47)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==98, 48)

preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==100, 49)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==102, 50)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==104, 51)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==106, 52)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==108, 53)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==110, 54)

preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==112, 55)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==114, 56)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==116, 57)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==118, 58)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==120, 59)

preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==122, 60)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==126, 61)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==128, 62)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==130, 63)

preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==132, 64)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==134, 65)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==136, 66)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==138, 67)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==140, 68)

preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==142, 69)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==144, 70)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==146, 71)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==148, 72)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==150, 73)

preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==152, 74)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==154, 75)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==156, 76)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==158, 77)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==160, 78)

preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==162, 79)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==164, 80)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==166, 81)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==168, 82)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==170, 83)

preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==172, 84)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==174, 85)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==176, 86)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==178, 87)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==180, 88)

preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==182, 89)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==184, 90)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==186, 91)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==188, 92)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==190, 93)

preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==192, 94)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==194, 95)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==196, 96)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==198, 97)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==200, 98)

preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==202, 99)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==204, 100)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==206, 101)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==208, 102)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==210, 103)

preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==212, 104)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==214, 105)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==216, 106)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==218, 107)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==220, 108)

preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==222, 109)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==224, 110)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==226, 111)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==228, 112)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==230, 113)

preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==232, 114)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==234, 115)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==236, 116)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==238, 117)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==240, 118)

preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==242, 119)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==246, 120)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==248, 121)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==250, 122)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==252, 123)

preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==254, 124)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==256, 125)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==258, 126)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==260, 127)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==262, 128)

preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==264, 129)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==266, 130)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==268, 131)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==270, 132)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==272, 133)

preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==274, 134)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==276, 135)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==278, 136)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==280, 137)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==282, 138)

preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==284, 139)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==286, 140)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==288, 141)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==290, 142)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==292, 143)

preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==295, 144)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==297, 145)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==299, 146)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==301, 147)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==303, 148)

preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==305, 149)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==307, 150)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==309, 151)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==311, 152)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==313, 153)

preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==315, 154)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==317, 155)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==319, 156)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==321, 157)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==323, 158)

preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==325, 159)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==327, 160)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==329, 161)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==331, 162)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==333, 163)

preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==336, 164)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==338, 165)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==340, 166)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==342, 167)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==344, 168)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==346, 169)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==348, 170)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==350, 171)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==352, 172)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==354, 173)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==356, 174)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==358, 175)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==360, 176)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==362, 177)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==364, 178)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==366, 179)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==368, 180)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==370, 181)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==372, 182)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==374, 183)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==376, 184)



#Find the eye location
lengt <- length(preds_minimal$subject)
for (i in 1:lengt) {
  if (preds_minimal$x[i] < 0.5 && preds_minimal$y[i] > 0.5) {
    preds_minimal$eyeloc[i] = "TL"
  } else if (preds_minimal$x[i] > 0.5 && preds_minimal$y[i] > 0.5) {
    preds_minimal$eyeloc[i] = "TR"
  } else if (preds_minimal$x[i] < 0.5 && preds_minimal$y[i] < 0.5) {
    preds_minimal$eyeloc[i] = "LL"
  } else if (preds_minimal$x[i] > 0.5 && preds_minimal$y[i] < 0.5) {
    preds_minimal$eyeloc[i] = "LR"
  } else {
  }
}


alldata <- (merge(preds_minimal, eyeinfo, by = 'trial'))

write.csv(alldata,"well_004_all.csv",row.names=FALSE)

#Some rows contain "END OF FILE" and nothing else. You can exclude these rows using this line.
#data_all<-data_all[data_all$ï..Event.Index!="End of Collection Screen",]
