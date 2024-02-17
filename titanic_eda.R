install.packages("titanic")

library(titanic)
library(ggplot2)

df<-titanic_train

head(df)        

str(df)

summary(df)

ggplot(df,aes(x= Pclass)) + geom_bar() + facet_wrap(~Sex)
