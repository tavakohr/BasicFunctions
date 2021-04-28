rm(list=ls())
library( tidyverse)
if ( !require(xlsx)) install.packages("xlsx")
if ( !require(xml)) install.packages("xml")
library(xlsx)
library(XML)
getwd()
#setwd()

####################### 1  create a directory if it doesn't exist

if (!file.exists("data")){
  dir.create("data")
}

fileUrl<-"https://opendata.arcgis.com/datasets/7055dbb02f0c4f14ab7ea3eb5ebfda42_0.csv?outSR=%7B%22latestWkid%22%3A3857%2C%22wkid%22%3A102100%7D" 
download.file(fileUrl,destfile ='./data/cameras.csv',method='curl' )
list.files('./data')
dateDownloaded<-date()
dateDownloaded

df<-read.table('./data/cameras.csv',sep=',', header = TRUE, nrows=10,quote="")


####################### 2 Reading Excel Files ############################
a<-list.files('./txt')

for (eachfile in  a){
  print (paste("./txt/" , eachfile, sep = '') )
  file.remove(paste("./txt/" , eachfile, sep = ''))
}
file.remove( "./txt")



fileUrlxlsx="https://file-examples-com.github.io/uploads/2017/02/file_example_XLSX_5000.xlsx"
download.file(fileUrlxlsx,destfile ='./data/excel.xlsx',method='curl' )

exceldf=read.xlsx('./data/excel.xlsx', sheetIndex = 1, header=TRUE)
# colIndex= 1:2
# rowIndex= 3:4
# write.xlsx
 
exceldf=read.xlsx2('./data/excel.xlsx', sheetIndex = 1, header=TRUE)
# XLConnet
###############     3  Reading XML     ##################################



xmlurl<-"http://api.worldbank.org/indicators"
doc<-xmlTreeParse(xmlurl,useInternalNodes = TRUE)

rootNode<-xmlRoot(doc)
xmlName(rootNode)
names(rootNode)


rootNode[[2]][[3]]
d<-data.frame(xmlSApply(rootNode, xmlValue))
colnames(d)<-'XMLvalue'
#XPath

xpathSApply(rootNode, "//wb:name", xmlValue)
htmlfile<-'https://www.espn.com'
doc<-htmlTreeParse(htmlfile, useInternalNodes = TRUE)

###############     4  Reading JSON     ##################################
if (!require(jsonlite)) install.packages("jsonlite")
library(jsonlite)
jsonfile<-'https://api.github.com/users/jtleek/repos'
jsonData<-fromJSON(jsonfile)
names(jsonData)

names(jsonData$owner$login)

myjason<-toJSON(iris, pretty = TRUE)
cat(myjason)

iris2<-fromJSON(myjason)
head(iris2)
str(iris2)

#################### 5 data.table ####################################

library(data.table)
DF=data.frame(x=rnorm(9),y=rep(c("a",'b','c'),each=3), z=rnorm(9))
DT=data.table(x=rnorm(9),y=rep(c("a",'b','c'),each=3), z=rnorm(9))


tables()
DT[2,]
DT[DT$y=='a',]
DT[,c(2,3)]
DT[, list(mean(x), sum(z))]
DT[,table(y)]
table(DT$y)

#add new column in data table
DT[,w:=exp(x)+z^2]
#use copy to crate 

DT[,m:={tmp<-(x+z); log2(tmp+5)}]

DT[,b:=mean(z),by=y]


set.seed(123);
DT<-data.table(x=sample(letters[1:4],1E4,TRUE))
head(DT)
DT[,.N , by=x]


### Keys
DT= data.table(x=rep(c("a","b","c") , each=100) , y=rnorm(300))
setkey(DT,x)
DT['a']


### Join
DT1=data.table(x=c('a','b','c','dt'), y=1:4)
DT2=data.table(x=c('a','b','c','dt'),z=rnorm(4))

setkey(DT1,x)
setkey(DT2,x)
merge(DT1,DT2)

