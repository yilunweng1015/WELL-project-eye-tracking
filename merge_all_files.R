library(tidyverse)
library(rio)

# Convert xlsx to csv format
xls <- dir(pattern = "xlsx")
created <- mapply(convert, xls, gsub("xlsx", "csv", xls))
unlink(xls) # delete xlsx files

#file.rename(list.files(pattern="27846_*.csv"), paste0("well_001_", 1:184))


# Load and merge mutipul csv files 
data_all <- list.files(pattern = "*.csv", full.names = TRUE) %>% 
  lapply(read_csv) %>%                                            # Store all files in list
  bind_rows                                                       # Combine data sets into one data set 
eyeinfo <- read.csv("~/Desktop/well_project/trial_info.csv")

#Drop rows that are not predictions 
preds <- data_all[grepl("prediction", data_all$type),]


#Make dataframe with just Time, X, Y and Trial columns 
preds_minimal <- preds %>%
  select(time_elapsed, x_pred_normalised, y_pred_normalised, spreadsheet_row)
preds_minimal <- preds_minimal %>%
  rename(time = time_elapsed, x = x_pred_normalised, y = y_pred_normalised, trial = spreadsheet_row) 


#Add subject ID
preds_minimal$subject <- c("well_p_001")


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
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==125, 61)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==127, 62)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==129, 63)

preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==131, 64)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==133, 65)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==135, 66)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==137, 67)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==139, 68)

preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==141, 69)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==143, 70)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==145, 71)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==147, 72)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==149, 73)

preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==151, 74)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==153, 75)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==155, 76)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==157, 77)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==159, 78)

preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==161, 79)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==163, 80)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==165, 81)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==167, 82)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==169, 83)

preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==171, 84)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==173, 85)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==175, 86)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==177, 87)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==179, 88)

preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==181, 89)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==183, 90)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==185, 91)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==187, 92)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==189, 93)

preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==191, 94)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==193, 95)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==195, 96)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==197, 97)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==199, 98)

preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==201, 99)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==203, 100)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==205, 101)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==207, 102)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==209, 103)

preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==211, 104)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==213, 105)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==215, 106)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==217, 107)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==219, 108)

preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==221, 109)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==223, 110)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==225, 111)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==227, 112)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==229, 113)

preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==231, 114)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==233, 115)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==235, 116)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==237, 117)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==239, 118)

preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==241, 119)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==243, 120)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==246, 121)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==248, 122)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==250, 123)

preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==252, 124)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==254, 125)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==256, 126)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==258, 127)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==260, 128)

preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==262, 129)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==264, 130)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==266, 131)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==268, 132)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==270, 133)

preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==272, 134)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==274, 135)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==276, 136)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==278, 137)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==280, 138)

preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==282, 139)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==284, 140)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==286, 141)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==288, 142)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==290, 143)

preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==292, 144)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==294, 145)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==296, 146)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==298, 147)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==300, 148)

preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==302, 149)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==304, 150)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==306, 151)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==308, 152)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==310, 153)

preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==312, 154)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==314, 155)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==316, 156)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==318, 157)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==320, 158)

preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==322, 159)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==324, 160)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==326, 161)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==328, 162)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==330, 163)

preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==332, 164)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==334, 165)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==336, 166)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==338, 167)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==340, 168)

preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==342, 169)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==344, 170)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==346, 171)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==348, 172)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==350, 173)

preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==352, 174)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==354, 175)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==356, 176)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==358, 177)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==360, 178)

preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==362, 179)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==364, 180)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==366, 181)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==368, 182)
preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==370, 183)

preds_minimal$trial<-replace(preds_minimal$trial, preds_minimal$trial==372, 184)


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

write.csv(alldata,"well_pilot_001.csv",row.names=FALSE)

#Some rows contain "END OF FILE" and nothing else. You can exclude these rows using this line.
#data_all<-data_all[data_all$ï..Event.Index!="End of Collection Screen",]
