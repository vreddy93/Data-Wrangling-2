library(tidyr)
library(dplyr)

#Loading Data

data<-read.csv("~/Desktop/R/Data Wrangling/Projects/Titanic/titanic_original.csv")
titanic<-tbl_df(data)
View(titanic)

#Replace missing values in embarked 

titanic$embarked[titanic$embarked==""] <- "S"

#Replace missing values in Age with mean

titanic$age[is.na(titanic$age)] <- mean(titanic$age, na.rm=TRUE)

#Replace missing values in boat 

titanic$boat[titanic$boat==""] <- "NA"
filter(titanic,is.na(boat)) 
#Add new column has_cabin_number; 1 = has cabin # , 0 = no cabin # 

titanic<- mutate(titanic, has_cabin_number = ifelse(titanic$cabin == "",0,1))

write.csv(titanic,"~/Desktop/R/Data Wrangling/Projects/Titanic/titanic_clean.csv")
                 
