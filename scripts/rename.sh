#!/bin/bash

PROJECT_DIR="$(git rev-parse --show-toplevel)"

replace_string_in_directory() {
    local directory="$1"
    local search_string="$2"
    local replace_string="$3"

    # Check if directory exists
    if [ ! -d "$directory" ]; then
        echo "Directory '$directory' does not exist."
        return 1
    fi

    # Find files containing the search string and replace it
    find "$directory" -type f -exec grep -l "$search_string" {} + | while IFS= read -r file; do
        echo "Processing file: $file"
        sed -i '' "s/$search_string/$replace_string/g" "$file"
    done

    echo "Replacement complete."
}

rename_files_with_string() {
    local directory="$1"
    local search_string="$2"
    local replace_string="$3"

    # Check if directory exists
    if [ ! -d "$directory" ]; then
        echo "Directory '$directory' does not exist."
        return 1
    fi

    # Find files containing the search string and rename them
    find "$directory" -type f -name "*$search_string*" | while IFS= read -r file; do
        new_name="${file//$search_string/$replace_string}"
        echo "Renaming file: $file to $new_name"
        mv "$file" "$new_name"
    done

    echo "File renaming complete."
}

echo "Enter the new project name:"
read NEW_PROJECT_NAME

echo "You entered: $NEW_PROJECT_NAME"

echo "Project name with default case: ${NEW_PROJECT_NAME}"

NEW_PROJECT_NAME_LOWERCASE=$(echo "$NEW_PROJECT_NAME" | tr '[:upper:]' '[:lower:]')
echo "Project name with lowercase: ${NEW_PROJECT_NAME_LOWERCASE}"

NEW_PROJECT_NAME_UPPERCASE=$(echo "$NEW_PROJECT_NAME" | tr '[:lower:]' '[:upper:]')
echo "Project name with uppercase: ${NEW_PROJECT_NAME_UPPERCASE}"

read -p "Are you sure you want to continue? (y/n): " choice
case "$choice" in 
  y|Y ) 
    echo "You entered: $project_name"
    ;;
  n|N ) 
    echo "Operation aborted."
    exit 1
    ;;
  * ) 
    echo "Invalid choice. Operation aborted."
    exit 1
    ;;
esac

replace_string_in_directory "$PROJECT_DIR" "ExampleDSP" "$NEW_PROJECT_NAME"
replace_string_in_directory "$PROJECT_DIR" "EXAMPLEDSP" "$NEW_PROJECT_NAME_UPPERCASE"
replace_string_in_directory "$PROJECT_DIR" "exampledsp" "$NEW_PROJECT_NAME_LOWERCASE"

rename_files_with_string "$PROJECT_DIR" "ExampleDSP" "$NEW_PROJECT_NAME"
rename_files_with_string "$PROJECT_DIR" "EXAMPLEDSP" "$NEW_PROJECT_NAME_UPPERCASE"
rename_files_with_string "$PROJECT_DIR" "exampledsp" "$NEW_PROJECT_NAME_LOWERCASE"