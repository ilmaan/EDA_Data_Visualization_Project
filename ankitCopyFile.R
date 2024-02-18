# Upload Obesity data CSV file
data <- read.csv("ObesityDataSet_raw_and_data_sinthetic.csv")
View(data)
# Load the ggplot2 library
library(ggplot2)
library(tidyverse)
library(ggcorrplot)
#Visualization 1:corelation map of variables-------------------
# Check the data types of each column
column_types <- sapply(data, class)

# Select columns with numerical values
numeric_columns <- names(column_types[column_types %in% c("numeric", "integer")])

# Display the selected numeric columns
selected_data <- data[, numeric_columns]

#compute correlations between the variables. 
#The round function is then applied to round the correlation matrix to one decimal place.
corr <- round(cor(selected_data), 1)
ggcorrplot(corr)
#------------------------------------------------------

#------------------------------------------------------
# Visualization 2: Scatter plot for Age vs. BMI (Body Mass Index)
ggplot(data, aes(x = Age, y = Weight / (Height^2), color = NObeyesdad)) +
  geom_point() +
  labs(title = "Scatter Plot: Age vs. BMI",
       x = "Age",
       y = "BMI",
       color = "Obesity Category")

# -----------------------------------------

# Visualization 3: Bar plot for Gender distribution
ggplot(data, aes(x = Gender)) +
  geom_bar(fill = "skyblue") +
  labs(title = "Gender Distribution")
# -----------------------------------------

# Visualization 4: Bar plot for Gender distribution
ggplot(data, aes(x = NObeyesdad)) +
  geom_bar(aes(color = NObeyesdad)) +
  labs(title = "Obesity category Distribution",x="Obesity Category")

# -----------------------------------------

##Visualization 5: Density plot for Age
ggplot(data, aes(x = Age, fill = NObeyesdad)) +
  geom_density(alpha = 0.5) +
  labs(title = "Density Plot: Age by Obesity Category",
       x = "Age",
       fill = "Obesity Category")

# -----------------------------------------

# Visualization 6: Pie chart for family history with overweight
ggplot(data, aes(x = "", fill = family_history_with_overweight)) +
  geom_bar(stat = "count", width = 1) +
  coord_polar(theta = "y") +
  labs(title = "Family History with Overweight",
       fill = "Family History")

# Visualization 7:--------------------------------------------------
## Count plot for CAEC
ggplot(data, aes(x = CAEC, fill = CAEC)) +
  geom_bar()
  labs(title = "Count Plot: CAEC",
       x = "CAEC",
       y = "Count",
       fill = "CAEC")
  
#-----------------------------------------------
# Visualization 8: Plotting density of 'Age' by 'Gender'
  ggplot(data, aes(x = Age, fill = Gender)) +
    geom_density(alpha = 0.5) +
    labs(title = "Density Plot of Age by Gender",
         x = "Age",
         y = "Density") +
    scale_fill_manual(values = c("blue", "pink"))

#-----------------------------------------------
  # Visualization 9: Plotting density of 'Age' by 'Gender'
  ggplot(data, aes(x = Age, fill = Gender)) +
    geom_density(alpha = 0.5) +
    labs(title = "Density Plot of Age by Gender",
         x = "Age",
         y = "Density") +
    scale_fill_manual(values = c("blue", "pink"))