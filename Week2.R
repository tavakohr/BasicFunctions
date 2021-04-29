
#################### 1 MySQL ###############################
library(DBI)
if (!require(odbc))  install.packages('odbc')
library(odbc)
if (!require(RMySQL))  install.packages('RMySQL')
library(RMySQL) 
drv <- dbDriver("MySQL")

ucsDB<-dbConnect(drv, user='genome', host="genome-mysql.cse.ucsc.edu")
results<-dbGetQuery(ucsDB, "show databases;"); dbDisconnect(ucsDB);
results
getwd()



# human genome
hg19<-dbConnect(drv, user='genome', db='hg19' ,host="genome-mysql.cse.ucsc.edu")
allTables<-dbListTables(hg19)
length(allTables)

allTables[1:5]
dbListFields(hg19,'affyU133Plus2')


dbGetQuery(hg19, "select count(*) from acemblyClass")
affyData<-dbReadTable(hg19,"affyU133Plus2")
head(affyData)

query<-dbSendQuery(hg19, "select * from affyU133Plus2 where misMatches between 1 and 3")

affMis<-fetch(query);quantile(affMis$misMatches)


affMisSmall<-fetch(query, n=10); dbClearResult(query)

dim(affMisSmall)
dbDisconnect(hg19)


############### 2  HDF5 #######################
if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")
BiocManager::install("rhdf5")
