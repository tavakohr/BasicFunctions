if ( !require(xlsx)) install.packages("xlsx")
if (!require(jsonlite)) install.packages("jsonlite")

if (!require(rjson)) install.packages("rjson")
library(jsonlite)
library(xlsx)
library(rjson) 

xlsxfile<-file.choose()
exceldf1=read.xlsx(xlsxfile, sheetIndex = 1, header=TRUE)
json1<-toJSON(exceldf1, pretty = TRUE)

exceldf2=read.xlsx(xlsxfile, sheetIndex = 2, header=TRUE)
json2<-toJSON(exceldf2, pretty = TRUE)

exceldf3=read.xlsx(xlsxfile, sheetIndex = 3, header=TRUE)
json3<-toJSON(exceldf3, pretty = TRUE)


exceldf4=read.xlsx(xlsxfile, sheetIndex = 4, header=TRUE)
json4<-toJSON(exceldf4, pretty = TRUE)

exceldf5=read.xlsx(xlsxfile, sheetIndex = 5, header=TRUE)
json5<-toJSON(exceldf5, pretty = TRUE)

library(jsonlite)

ID=c(100,110,200)
Title=c("aa","bb","cc")

df <- data.frame(ID, Title)
more=data.frame(Interesting=c("yes","no","yes"),new=c("no","yes","yes"),original=c("yes","yes","no"))
df$more <- more

 
