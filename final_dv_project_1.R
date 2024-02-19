# Upload Obesity dataset CSV file
data <- read.csv("ObesityDataSet_raw_and_data_sinthetic.csv")

# Check the structure of the dataset
str(data)

head(data)
summary(data)
dim(data)
names(data)

# Load the ggplot2 library
library(ggplot2)
install.packages('dplyr')
library(corrplot)
library(dplyr)
install.packages('ggcorrplot')
library(ggcorrplot)



# Visualization 1: Histogram for age distribution in dataset

ggplot(data, aes(x=Age)) +
  geom_histogram(bins=10) +
  labs(title="Age Distribution",
       x="Age",
       y="Count")


#  Visualization 2: Count occurrences of each obesity type
obesity_counts <- table(data$NObeyesdad)

# Convert to data frame
obesity_counts_df <- as.data.frame(obesity_counts)
names(obesity_counts_df) <- c("Obesity_Type", "Count")

# Create bar plot
ggplot(data = obesity_counts_df, aes(x = Obesity_Type, y = Count, fill = Obesity_Type)) +
  geom_histogram(stat = "identity", alpha = 0.7) +  # Bar plot
  labs(title = "Density Distribution of Obesity Types",
       x = "Obesity Type",
       y = "Count") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))  # Rotate x-axis labels


# Visualization 3: Scatter plot for Age vs. BMI (Body Mass Index)

ggplot(data, aes(x = Age, y = Weight / (Height^2), color = NObeyesdad)) +
  geom_point() +
  labs(title = "Scatter Plot: Age vs. BMI",
       x = "Age",
       y = "BMI",
       color = "Obesity Category")


# Visualization 4: Scattered bar plot : Disparities in Obesity Type vs Gender
cross_plot <- function(dataset, lead_category, sup_category, order = NULL) {
  # Calculate percentages
  percentage_data <- dataset %>%
    group_by(.data[[lead_category]], .data[[sup_category]]) %>%
    summarise(count = n()) %>%
    group_by(.data[[lead_category]]) %>%
    mutate(percentage = count / sum(count) * 100)
  
  # Create a cross plot
  p <- ggplot(data = percentage_data, aes(x = .data[[lead_category]], y = percentage, fill = .data[[sup_category]])) +
    geom_bar(stat = "identity", position = "dodge", width = 0.7) +  # Set position to "dodge" and adjust width of bars
    geom_text(aes(label = paste0(round(percentage), "%")), position = position_dodge(width = 0.7), vjust = -0.5, size = 3) +  # Add percentage labels
    labs(title = paste("Interaction between", lead_category, "and", sup_category),
         x = lead_category,
         y = "Percentage",
         fill = sup_category) +
    theme_minimal() +
    theme(axis.text.x = element_text(angle = 45, hjust = 1))  # Rotate x-axis labels
  
  # Optionally, reorder the categories
  if (!is.null(order)) {
    p <- p + scale_x_discrete(limits = order)
  }
  
  print(p)
}

cross_plot(data, "NObeyesdad", "Gender")



# Visualization 5 : Box plot for relationship between Weight vs. FAVC

ggplot(data, aes(x = FAVC, y = Weight, color = FAVC)) +
  geom_boxplot() +
  labs(title = "Relationship between FAVC and Weight",
       x = "Frequent Consumption of High Caloric Food",
       y = "Weight") +
  scale_y_continuous(breaks = seq(0, max(data$Weight), by = 20))



# Visualization 6 :Bar Chart + Histogram:  Decoding Obesity - The Role of Family History and Genetic Predisposition 
# Calculate percentage levels
percentage_data <- data %>%
  group_by(family_history_with_overweight, NObeyesdad) %>%
  summarise(count = n()) %>%
  mutate(percentage = count / sum(count) * 100)

# Create histogram with percentage labels
ggplot(percentage_data, aes(x = family_history_with_overweight, y = percentage, fill = NObeyesdad)) +
  geom_bar(stat = "identity", position = position_dodge()) +
  geom_text(aes(label = paste0(round(percentage), "%")), position = position_dodge(width = 0.9), vjust = -0.5, size = 3) +
  labs(title = "Distribution of Obesity Types by Family History of Overweight",
       x = "Family History of Overweight",
       y = "Percentage",
       fill = "Obesity Type") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))  # Rotate x-axis labels by 45 degrees



# Visualization 7 : Distribution of Obesity Types by Transport used
# Calculate percentage levels
percentage_data <- data %>%
  group_by(MTRANS, NObeyesdad) %>%
  summarise(count = n()) %>%
  mutate(percentage = count / sum(count) * 100)

# Create histogram with percentage labels
ggplot(percentage_data, aes(x = MTRANS, y = percentage, fill = NObeyesdad)) +
  geom_bar(stat = "identity", position = position_dodge()) +
  geom_text(aes(label = paste0(round(percentage), "%")), position = position_dodge(width = 0.9), vjust = -0.5, size = 3) +
  labs(title = "Distribution of Obesity Types by Transport used",
       x = "Transport Used",
       y = "Percentage",
       fill = "Obesity Type") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))



##Visualization 8: Density plot for Age vs smoking
ggplot(data, aes(x = Age, fill = SMOKE)) +
  geom_density(alpha = 0.5) +
  labs(title = "Density Plot: Age vs Smoke",
       x = "Age",
       fill = "Smoking")




#Visualization 9:correlation map of variables
# Check the data types of each column
column_types <- sapply(data, class)

# Select columns with numerical values
numeric_columns <- names(column_types[column_types %in% c("numeric", "integer")])

# Display the selected numeric columns
selected_data <- data[, numeric_columns]

#compute correlations between the variables. 
#The round function is then applied to round the correlation matrix to one decimal place.
corr <- round(cor(selected_data), 1)
ggcorrplot(corr) +labs(title = "Numeric Variables Correlations")






