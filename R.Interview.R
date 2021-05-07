if (!require(tidyverse)) install.packages('tidyverse')
rm(list=ls())
library(tidyverse)
library(ggplot2)
library(haven)

with (iris,Species[Petal.Width==0.2])

by (iris[,1:4],iris$Species ,summary )


subset(iris,   ( Petal.Length>2 & Petal.Width>1.2)   , select = c(Petal.Length ,  Petal.Width))

a<-sample(c(1,2,3),10000, replace=TRUE  , prob=c(4,2,4))
tabulate(a)

aa<-sample(nrow(iris),1000,replace=T)

dd<-iris[aa,]


tIris<-data.frame(t(iris))
