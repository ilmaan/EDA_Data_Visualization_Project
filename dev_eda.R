# Upload Titanic dataset CSV file
data <- read.csv("ObesityDataSet_raw_and_data_sinthetic.csv")
View(data)
# Load the ggplot2 library
library(ggplot2)

# Assuming your CSV file is loaded into a variable called 'data'
# Replace 'Age' with the column name that contains the ages in your dataset
ggplot(data, aes(x = age)) +
  geom_histogram(binwidth = 5, fill = "skyblue", color = "black") +
  labs(title = "Distribution of Passenger Ages",
       x = "Age",
       y = "Frequency") +
  theme_minimal()

