library(tidyverse)
library(rio)

# Convert xlsx to csv format
xls <- dir(pattern = "xlsx")
created <- mapply(convert, xls, gsub("xlsx", "csv", xls))
unlink(xls) # delete xlsx files

# Load and merge mutipul csv files 
data_all <- list.files(pattern = "*.csv", full.names = TRUE) %>% 
  lapply(read_csv) %>%                                            # Store all files in list
  bind_rows                                                       # Combine data sets into one data set 
 

#Some rows contain "END OF FILE" and nothing else. You can exclude these rows using this line.
data_all<-data_all[data_all$ï..Event.Index!="End of Collection Screen",]

#This line exports your combined data as a CSV. This new CSV will be called "combineddata.csv" and will appear in your working directory
write.csv(data_all,"well_pilot001.csv",row.names=FALSE)