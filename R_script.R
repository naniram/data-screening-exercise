# Import necessary libraries
# tidyverse for data manipulation and reading, ggplot2 for plotting
library(tidyverse)
library(ggplot2)

# Load dataset
icdtn_data <- read_csv("messy_ice_detention.csv", skip = 6)
glimpse(icdtn_data)
head(icdtn_data)

#  Lists the current column names.
colnames(icdtn_data)

# Rename the columns to meaningful, clean names.
colnames(icdtn_data) <- c("Name", "City", "State", "Level_A", "Level_B", "Level_C", "Level_D", "Last_Inspection_End_Date")

#Checking Missing values
colSums(is.na(icdtn_data))

# Convert Name column to UTF-8 and remove untranslatable characters
icdtn_data$Name <- iconv(icdtn_data$Name, from = "latin1", to = "UTF-8", sub = "")

# Remove special characters and trim whitespace
icdtn_data$Name <- gsub("[^[:alnum:] [:space:]]", "", icdtn_data$Name)
icdtn_data$Name <- str_trim(icdtn_data$Name)

head(icdtn_data)

# checking data types
str(icdtn_data)

# Convert Excel date serial number to Date
# Excel serial date origin is 1899-12-30
icdtn_data$Last_Inspection_End_Date <- as.Date(as.numeric(icdtn_data$Last_Inspection_End_Date), origin = "1899-12-30")

head(icdtn_data)

# Find na rows
# Find rows where City is NA
na_rows <- which(is.na(icdtn_data$City))
print(na_rows)
icdtn_data[na_rows, ]

# Replace NA in the City column with "CHARDON"
# I googled and found the exact city name 
icdtn_data$City[is.na(icdtn_data$City)] <- "CHARDON"

# Find rows where State is NA
na_state_rows <- which(is.na(icdtn_data$State))

# Print the row numbers
print(na_state_rows)

# View those rows
icdtn_data[na_state_rows, ]

# Replace NA in State where Name is "ATLANTAUSPEN" with "GA"
# I googled and found the state location
icdtn_data$State[icdtn_data$Name == "ATLANTAUSPEN"] <- "GA"

# Replace NA in State where Name is "LA SALLE COUNTY REGIONAL DETENTION CENTER" with "TX"
icdtn_data$State[icdtn_data$Name == "LA SALLE COUNTY REGIONAL DETENTION CENTER"] <- "TX"

# Again let's check for the missing values
colSums(is.na(icdtn_data))

# Remove rows where Name is NA
icdtn_data <- icdtn_data[!is.na(icdtn_data$Name), ]

# We still have 18 rows with na in Last_Inspection_End_Date  column
# We're not going to remove or manipulate these, as it maybe sensitive


# Create Total_Population column
icdtn_data$Total_Population <- icdtn_data$Level_A + icdtn_data$Level_B + icdtn_data$Level_C + icdtn_data$Level_D

# View the updated dataframe
head(icdtn_data)

# Get top 10 rows with highest Total_Population
top_10_population <- icdtn_data[order(-icdtn_data$Total_Population), ][1:10, ]

# Print the result
print(top_10_population)

# Create the bar plot
population_plot <- ggplot(top_10_population, aes(x = reorder(Name, Total_Population), y = Total_Population)) +
  geom_bar(stat = "identity", fill = "steelblue") +
  coord_flip() +  # Flip coordinates for horizontal bars
  labs(title = "Top 10 Largest Detention Facilities by Population",
       x = "Detention Facility",
       y = "Total Population") +
  theme_minimal()

# Display the plot
print(population_plot)

# Save the plot as a PNG image
ggsave("top_10_facilities_population.png", plot = population_plot, width = 10, height = 6, dpi = 300)

# Save the cleaned dataset
write_csv(icdtn_data, "cleaned_ice_detention_data.csv")
