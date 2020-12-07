#__ Needed Librarys __####
{library(ggplot2)
  library(dplyr)
  library(lubridate)  #Used for DateTime
  library(timeDate) #Time Date has to be loaded in after lubridate. If this is not done the function "hour()" and other date fucntions will not work past year 2038. (look up 32bit Integer for more information)
  library(smooth)
  library(dummies)  #https://cran.r-project.org/web/packages/dummies/dummies.pdf
  library(readr)
  library(RcppRoll) #Used for roll_mean (Moving average)
  library(stringi)
  library(stringr)
  library(bit64)
  library(openxlsx)
  library(tidyverse)
  library(tidyr)
  
  rm(list = setdiff(ls(),c(lsf.str())))
  setwd(dirname(rstudioapi::getSourceEditorContext()$path))} #Packages and SET dir
list.files()


## System Intertie


## Walnut Parker 5910579 | 5910579

files <- list.files(pattern = ".csv")

#d <- as.data.frame(read_csv("5910579.csv"))

d <- x
fix.date <- function(d){
d$DATE <- as.character(d$DATE)
d <- d[!is.na(d$DATE),]
d[nchar(d[,"DATE"]) == 5,"DATE"]  <- as.character(paste0("0",d[nchar(d[,"DATE"]) == 5,"DATE"]))

d$DATE <- paste(substr(d$DATE,1,2),substr(d$DATE,3,4),substr(d$DATE,5,6),sep = "/")
d$HOUR <- as.integer(d$HOUR)/100
return(d)
}



as.integer()




for(i in files[20:27]){
  
  x <- as.data.frame(read_csv(i))
  write_csv(fix.date(d = x),i)
  
  
}

