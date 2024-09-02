# Load the ggplot2 package
library(ggplot2)

# 1. Basic Histogram
gg_histo <- ggplot(scabies, aes(x = age)) +
  geom_histogram(breaks = seq(0, 80, by = 5), fill = "blue", color = "black") +
  labs(title = "Distribution of Age in Study", y = "Number of Participants", x = "Age (yrs)")

# Display the histogram
gg_histo

# 2. Scatterplot
gg_scatter <- ggplot(scabies, aes(x = house_inhabitants, y = room_cohabitation)) +
  geom_point(aes(colour = factor(gender)), size = 3) +
  labs(title = "House Size vs Number of People Sharing a Room", x = "House Size", y = "People Sharing a Room")

# Display the scatterplot
gg_scatter

# 3. Boxplot
gg_boxplot <- ggplot(scabies, aes(x = gender, y = age)) +
  geom_boxplot(aes(fill = factor(gender)), color = "black") +
  labs(title = "Distribution of Age by Gender", y = "Age", x = "Gender")

# Display the boxplot
gg_boxplot

# 4. Faceted Histogram by Village
gg_histo_by_village <- ggplot(scabies, aes(x = age, fill = gender)) +
  geom_histogram(breaks = seq(0, 80, by = 2), color = "black") +
  labs(title = "Distribution of Age by Village", y = "Number of Participants", x = "Age (yrs)") +
  facet_wrap(~Village)

# Display the faceted histogram
gg_histo_by_village
