# In this section, we will use the `ggplot2` package to create advanced visualizations for the `scabies` dataset.

# 6.1 Install and Load ggplot2
# Ensure ggplot2 is installed and loaded

if (!require(ggplot2)) {
  install.packages("ggplot2")
}
library(ggplot2)

# 6.2 Histogram of Age Distribution
# Visualizing the age distribution of scabies patients using a histogram

ggplot(scabies, aes(x = age)) +
  geom_histogram(binwidth = 5, fill = "blue", color = "black") +
  labs(title = "Age Distribution of Scabies Patients", x = "Age", y = "Frequency") +
  theme_minimal()

# 6.3 Scatter Plot: House Size vs. Room Cohabitation
# Creating a scatter plot to examine the relationship between house inhabitants and room cohabitation

ggplot(scabies, aes(x = house_inhabitants, y = room_cohabitation)) +
  geom_point(color = "blue") +
  labs(title = "House Size vs. Room Cohabitation", x = "House Inhabitants", y = "Room Cohabitation") +
  theme_minimal()

# 6.4 Scatter Plot with Color by Scabies Infestation
# Adding color to the scatter plot to distinguish between scabies infestation statuses

ggplot(scabies, aes(x = house_inhabitants, y = room_cohabitation, color = scabies_infestation)) +
  geom_point() +
  scale_color_manual(values = c("yes" = "red", "no" = "blue")) +
  labs(title = "House Size vs. Room Cohabitation by Scabies Infestation", 
       x = "House Inhabitants", y = "Room Cohabitation", color = "Scabies Infestation") +
  theme_minimal()

# 6.5 Jitter Plot to Reduce Overlap
# Applying jitter to the scatter plot to reduce the overlap of data points

ggplot(scabies, aes(x = house_inhabitants, y = room_cohabitation, color = scabies_infestation)) +
  geom_jitter(width = 0.2, height = 0.2) +
  scale_color_manual(values = c("yes" = "red", "no" = "blue")) +
  labs(title = "Jittered House Size vs. Room Cohabitation by Scabies Infestation", 
       x = "House Inhabitants", y = "Room Cohabitation", color = "Scabies Infestation") +
  theme_minimal()

# 6.6 Bar Plot of Scabies Infestation by Gender
# Creating a bar plot to compare the prevalence of scabies infestation between genders

ggplot(scabies, aes(x = gender, fill = scabies_infestation)) +
  geom_bar(position = "dodge") +
  labs(title = "Scabies Infestation by Gender", x = "Gender", y = "Count", fill = "Scabies Infestation") +
  theme_minimal()

# 6.7 Conclusion
# This section provided an introduction to creating advanced visualizations with ggplot2.
# These plots enhance the understanding of key relationships in the scabies dataset and improve the overall presentation of the project.
