library(jsonlite)

# Load the filtered "kit" data from the existing JSON file
filtered_kit_data <- fromJSON("/Users/mac12/Desktop/SCRIPTS/R/China&India/filtered_indi.json")

# Select 100 random objects from the filtered data
random_kit_data <- filtered_kit_data[sample(nrow(filtered_kit_data), 100, replace = FALSE), ]

# Write the selected data to a new JSON file
write_json(random_kit_data, "/Users/mac12/Desktop/SCRIPTS/R/China&India/random_indi.json")
