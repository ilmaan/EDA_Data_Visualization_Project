file_path <- "ObesityDataSet_raw_and_data_sinthetic.csv"
library(ggplot2)

# Read the CSV file into a data frame
df <- read.csv(file_path)

# Print a summary of the data frame
summary(df)

head(df)

#No People smoking based on the mode of transportation 
ggplot(df,aes(x= SMOKE)) + geom_bar() + facet_wrap(~MTRANS) + labs(title="People smoking based on the mode of transportation ")

#Scatter Plot of Age vs Weight
ggplot(df, aes(x = Age, y = Weight)) +
  geom_point(color = "purple") +
  labs(title = "Scatter Plot of Age vs Weight")

# Subset the data for smokers and non-smokers
smokers <- df[df$SMOKE == "yes", ]
non_smokers <- df[df$SMOKE == "no", ]

# histogram for smokers
ggplot(smokers, aes(x = Age, fill = SMOKE)) +
  geom_histogram(binwidth = 5, color = "white", position = "identity", alpha = 0.7) +
  labs(title = "Distribution of Age for Smokers",
       x = "Age",
       y = "Count") +
  scale_fill_manual(values = c("yes" = "red", "no" = "blue")) +
  theme_minimal()


#Weight distribution based on Mode of transportation

ggplot(df, aes(x = MTRANS, y = Weight, fill = MTRANS)) +
  geom_boxplot() +
  labs(title = "Weight Distribution by Mode of Transportation",
       x = "Mode of Transportation",
       y = "Weight") +
  scale_fill_manual(values = c("Automobile" = "lightblue", "Bike" = "green", "Motorbike" = "lightpink", "Public_Transportation" = "lightyellow", "Walking" = "lightgreen")) +
  theme_minimal()


# Box plot for weight based on mode of transportation
ggplot(df, aes(x = MTRANS, y = Weight, fill = MTRANS)) +
  geom_boxplot() +
  labs(title = "Weight Distribution by Mode of Transportation",
       x = "Mode of Transportation",
       y = "Weight") +
  scale_fill_manual(values = c("Public_Transportation" = "red", "Automobile" = "blue", "Walking" = "green", "Motorbike" = "purple", "Bike" = "orange")) +
  theme_minimal()


# Box plot for weight based on obesity level
ggplot(df, aes(x = NObeyesdad, y = Weight, fill = NObeyesdad)) +
  geom_boxplot() +
  labs(title = "Weight Distribution by Obesity Level",
       x = "Obesity Level",
       y = "Weight") +
  scale_fill_manual(values = c("Insufficient_Weight" = "grey","Obesity_Type_I" = "lightpink","Obesity_Type_II" = "red","Obesity_Type_III" = "darkred","Normal_Weight" = "green", "Overweight_Level_I" = "yellow", "Overweight_Level_II" = "orange")) +
  theme_minimal()

# Boxplot for weight by family history 
ggplot(df, aes(x=family_history_with_overweight, y=Weight)) + 
  geom_boxplot() +
  labs(title="Weight by Family History of Overweight",
       x="Family History", 
       y="Weight (kg)")

# 3. Relationship between FAVC (Frequent consumption of high caloric food) and Weight
ggplot(df, aes(x = FAVC, y = Weight, color = FAVC)) +
  geom_boxplot() +
  labs(title = "Relationship between FAVC and Weight",
       x = "Frequent Consumption of High Caloric Food",
       y = "Weight")

# 5. Transportation Mode and BMI
ggplot(df, aes(x = MTRANS, fill = NObeyesdad)) +
  geom_bar(position = "dodge") +
  labs(title = "Distribution of BMI by Transportation Mode",
       x = "Transportation Mode",
       y = "Count") +
  scale_fill_manual(values = c("Insufficient_Weight" = "grey","Obesity_Type_I" = "lightpink","Obesity_Type_II" = "red","Obesity_Type_III" = "darkred","Normal_Weight" = "green", "Overweight_Level_I" = "yellow", "Overweight_Level_II" = "orange"))
