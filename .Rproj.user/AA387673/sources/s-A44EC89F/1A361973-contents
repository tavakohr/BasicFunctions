rm(list=ls())
g <- read.csv(file = ".//data//simulated HF mort data for GMPH (1K) final.csv", header=TRUE, sep=',')
dim(g)
str(g)
head(g[,1:5])


library( survival)
library(ggplot2)
gender <- as.factor(g[,"gender"]) # R calls categorical variables factors
fu_time <- g[,"fu_time"] # continuous variable (numeric) 
death <- g[,"death"] # binary variable (numeric) 

km_fit <- survfit(Surv(fu_time, death) ~ 1)
plot(km_fit)
summary(km_fit)

summary(km_fit, times = c(1:7,30,60,90*(1:10))) 
km_fit<-survfit(Surv(g$fu_time, g$death)~1)
summary(km_fit,time=c(1,2,5,10,50, 100, 400,500))

km_gender_fit <- survfit(Surv(fu_time, death) ~ gender)
plot(km_gender_fit)

#With rho = 0, which is the default so we don’t need to write this bit, it yields the log-rank or Mantel-Haenszel test
survdiff(Surv(fu_time, death) ~ gender, rho=0) 




g$age_65plus <- ifelse(g[,"age"]>=65,1,0) # dichotomise age
table(g$age_65plus, exclude = NULL) # inspect the numbers - always a good idea
g$age_65plus
table(g$age,g$age_65plus, exclude = NULL) # check - an even better idea...
survdiff(Surv(g$fu_time,g$death)~g$age_65plus, rho=0)



#######################  Cox model #####################

