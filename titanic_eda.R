install.packages("titanic")

library(titanic)
library(ggplot2)

data("titanic_train")

df<-titanic_train

head(df)        

str(df)

summary(df)

ggplot(df,aes(x= Pclass)) + geom_bar() + facet_wrap(~Sex)

ggplot(df, aes(x = Pclass, fill = factor(Survived))) +
  geom_bar(binwidth = 1, position = "dodge") +  # Adjust binwidth as needed
  facet_wrap(~Sex) +
  geom_text(stat = 'count', aes(label = ..count..), position = position_dodge(width = 1), vjust = -0.5) +
  labs(title = "Survival Count by Passenger class and Sex",
       x = "Pclass",
       y = "Count",
       fill = "Survived") +
  theme_minimal()
