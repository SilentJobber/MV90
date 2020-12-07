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
files <- list.files(pattern = ".csv")


## System Intertie
# [1] "5877024.csv" "5877025.csv" "5910521.csv" "5910522.csv" "5910523.csv" "5910524.csv" "5910577.csv" "5910578.csv" "5910579.csv" "5910580.csv" "5910636.csv" "5910637.csv" "5910638.csv"
# [14] "5910639.csv" "DP1.csv"     "DP2.csv"     "DP3.csv"     "DP4.csv"     "MID100.csv"  "MID102.csv"  "MID104.csv"  "MID110.csv"  "MID112.csv"  "MID130.csv"  "MID132.csv"  "MID140.csv" 
# [27] "MID142.csv" 



## Walnut Parker 5910579 | 5910590 ####
x <- read_csv("5910579.csv")
x1  <- read_csv("5910580.csv")

  
x <- x %>% mutate(DATE = as.Date(DATE,format = "%m/%d/%y")) %>% ungroup() %>% group_by(Year = year(DATE),Month = month(DATE)) %>% select(-c(DATE,`RECORDER ID`,HOUR,IN,UN)) %>%
  summarize_all(sum,na.rm = T)


##Westly Parker B/U 5910577 | 5910578 ####

x  <- read_csv("5910577.csv")
x1 <- read_csv("5910578.csv")


x <- x %>% mutate(DATE = as.Date(DATE,format = "%m/%d/%y")) %>% ungroup() %>% group_by(Year = year(DATE),Month = month(DATE)) %>% select(-c(DATE,`RECORDER ID`,HOUR,IN,UN)) %>%
  summarize_all(sum,na.rm = T)

##Standiford Tower 1 5910521 | 5910522 #### 
# DATA from primary meter (5910521)

x  <- read_csv("5910521.csv")
x <- read_csv("5910522.csv")


x <- x %>% mutate(DATE = as.Date(DATE,format = "%m/%d/%Y")) %>% ungroup() %>% group_by(Year = year(DATE),Month = month(DATE)) %>% select(-c(DATE,`RECORDER ID`,HOUR,IN,UN)) %>%
  summarize_all(sum,na.rm = T)

##Standiford Tower 2 5910523 | 5910524 ####

x  <- read_csv("5910523.csv")
x1 <- read_csv("5910524.csv")


x <- x %>% mutate(DATE = as.Date(DATE,format = "%m/%d/%y")) %>% ungroup() %>% group_by(Year = year(DATE),Month = month(DATE)) %>% select(-c(DATE,`RECORDER ID`,HOUR,IN,UN)) %>%
  summarize_all(sum,na.rm = T)

##Westley Rosemore 1 5910636 |5910637

x  <- read_csv("5910636.csv")
x <- read_csv("5910637.csv")


x <- x %>% mutate(DATE = as.Date(DATE,format = "%m/%d/%Y")) %>% ungroup() %>% group_by(Year = year(DATE),Month = month(DATE)) %>% select(-c(DATE,`RECORDER ID`,HOUR,IN,UN)) %>%
  summarize_all(sum,na.rm = T)

##Kelso/Sub/Mtn House 5877024 

x  <- read_csv("5877024.csv")


x <- x %>% mutate(DATE = as.Date(DATE,format = "%m/%d/%y")) %>% ungroup() %>% group_by(Year = year(DATE),Month = month(DATE)) %>% select(-c(DATE,`RECORDER ID`,HOUR,IN,UN)) %>%
  summarize_all(sum,na.rm = T)


##Mtn House SUb #2 5877025

x  <- read_csv("5877025.csv")


x <- x %>% mutate(DATE = as.Date(DATE,format = "%m/%d/%y")) %>% ungroup() %>% group_by(Year = year(DATE),Month = month(DATE)) %>% select(-c(DATE,`RECORDER ID`,HOUR,IN,UN)) %>%
  summarize_all(sum,na.rm = T)

