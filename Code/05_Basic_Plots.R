# This section explores basic plotting techniques using base R.
# It includes histograms and scatterplots to visualize key variables in the scabies dataset.
# While these plots provide initial insights, later sections will introduce ggplot2 for more refined visualizations.

# 5.1 Histogram: Distribution of Age
# Visualize the distribution of age in the scabies dataset.
hist(scabies$age,
     main = "Histogram of Age in Scabies Dataset",
     xlab = "Age",
     ylab = "Frequency",
     col = "lightblue",
     border = "black")

# 5.2 Scatterplot: House Inhabitants vs Room Cohabitation
# Explore the relationship between the number of house inhabitants and room cohabitation.
plot(scabies$house_inhabitants, scabies$room_cohabitation,
     main = "Scatterplot of House Inhabitants vs Room Cohabitation",
     xlab = "Number of House Inhabitants",
     ylab = "Room Cohabitation",
     pch = 19,
     col = "darkgreen")

# 5.3 Color-Coded Scatterplot: Adding Scabies Infestation
# Enhance the scatterplot by adding color to represent scabies infestation.
scabies$scatter_colour[scabies$scabies_infestation == "yes"] <- "red"  # Red for infestation
scabies$scatter_colour[scabies$scabies_infestation == "no"] <- "blue"  # Blue for no infestation

plot(scabies$house_inhabitants, scabies$room_cohabitation,
     main = "Scatterplot of House Inhabitants vs Room Cohabitation by Scabies Infestation",
     xlab = "Number of House Inhabitants",
     ylab = "Room Cohabitation",
     pch = 19,
     col = scabies$scatter_colour)

# 5.4 Jittered Scatterplot: Handling Overlapping Points
# Apply jittering to the scatterplot to reduce overlap of points.
plot(jitter(scabies$house_inhabitants), scabies$room_cohabitation,
     main = "Jittered Scatterplot of House Inhabitants vs Room Cohabitation by Scabies Infestation",
     xlab = "Number of House Inhabitants (Jittered)",
     ylab = "Room Cohabitation",
     pch = 19,
     col = scabies$scatter_colour)

# Note: The visualizations above are foundational. 
# The next section will introduce ggplot2 to create more polished and publication-ready graphics.
