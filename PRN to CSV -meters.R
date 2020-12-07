list.files()

library(readr)
library(data.table)
library(stringr)

files <- data.frame(read = list.files(pattern = ".PRN"))
files$write <- str_replace(files$read,pattern = ".PRN", replacement = ".csv")

for(i in 1:nrow(files)){

  
  test <- fread(files$read[i])

  fwrite(test,files$write[i])
}
