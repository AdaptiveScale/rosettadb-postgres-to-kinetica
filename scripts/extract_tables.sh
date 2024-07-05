#!/bin/bash

# Capture the output of the previous command
input_string=$(cat)

# Extract table names
tables_in_model_not_in_target=()
tables_not_in_model_in_target=()

while IFS= read -r line; do
    tables_in_model_not_in_target+=("$line")
done < <(echo "$input_string" | grep "exists in the model, but it does not exist in the target database" | sed -E "s/Table '(.*)' exists in the model, but it does not exist in the target database./\1/")

while IFS= read -r line; do
    tables_not_in_model_in_target+=("$line")
done < <(echo "$input_string" | grep "does not exist in the model, but it exists in the target database" | sed -E "s/Table '(.*)' does not exist in the model, but it exists in the target database./\1/")

# Output the results
echo "Tables that exist in the model but not in the target database:"
printf "%s\n" "${tables_in_model_not_in_target[@]}"

echo ""
echo "Tables that do not exist in the model but exist in the target database:"
printf "%s\n" "${tables_not_in_model_in_target[@]}"

output_file="kisql.sql"

echo -n > "$output_file"

for item in "${tables_in_model_not_in_target[@]}"; do
    echo "Processing $item"
    if [[ -n "$item" ]]; then
        echo "LOAD INTO $TARGET_SCHEMA.$item" >> "$output_file"
        echo "FROM REMOTE QUERY 'SELECT * FROM $SOURCE_SCHEMA.$item'" >> "$output_file"
        echo "WITH OPTIONS (DATA SOURCE = 'postgres_ds');" >> "$output_file"
        echo "" >> "$output_file"
    else
        echo "Skipping empty table name"
    fi
done
