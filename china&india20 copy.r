library(jsonlite)
library(data.table)

# List of JSON files
json_files <- c("/sanctions/posts_1.json",
                "/sanctions/posts_2.json",
                #Other json files
                "/sanctions/posts_20.json"
                )

# Empty lists to store filtered text variables
kit_list <- list()
indi_list <- list()

# Loop through each JSON file
for (json_file in json_files) {
  # Read the JSON file
  json_data <- fromJSON(json_file)

  # Extract the objects with "text" variables containing "Кит" at the beginning of the word
  filtered_kit <- json_data[sapply(json_data, function(x) grepl("^Кит", x$text))]

  # Extract the "text" variables from the filtered objects
  kit_text_variables <- sapply(filtered_kit, function(x) x$text)

  # Create a list of separate objects for each text value
  kit_list <- c(kit_list, lapply(kit_text_variables, function(x) list(text = x)))

  # Extract the objects with "text" variables containing "Инди" at the beginning of the word 
  filtered_indi <- json_data[sapply(json_data, function(x) grepl("^Инди", x$text))]

  # Extract the "text" variables from the filtered objects
  indi_text_variables <- sapply(filtered_indi, function(x) x$text)

  # Create a list of separate objects for each text value
  indi_list <- c(indi_list, lapply(indi_text_variables, function(x) list(text = x)))
}

write_json(kit_dt, "filtered_kit.json")
write_json(indi_dt, "filtered_indi.json")
