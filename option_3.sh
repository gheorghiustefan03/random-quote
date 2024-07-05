#!/bin/bash

file_path="./quotes.txt" #places the "quotes.txt" file path in the "file_path" variable

read -p "Enter the quote to remove (line nr.): " line_number #prompts the user to enter a line number to remove and stores it in the "line_number" variable

#REPLACED CODE SECTION:
#if ! [ "$line_number" -eq "$line_number" ] 2>/dev/null; then
#    echo "Invalid line number. Removal cancelled."
#    exit 1
#fi

while ! [[ "$line_number" =~ ^[0-9]+$ ]]; do #checks if the number entered is a positive integer inside the while loop, keeps looping until valid input
    echo "Invalid line number. Please enter a valid number." #informs the user their input is invalid
    read -p "Enter the quote to remove (line nr.): " line_number #prompts the user again for valid input
done

line_content=$(sed -n "${line_number}p" "$file_path") #uses the "sed" command to extract the content from the specified line and stores it in the "line_content" variable

if [ -z "$line_content" ]; then #check if the line is empty
    echo "Line $line_number is blank. Removal cancelled."
    . ./randomQuote.sh #return to the main script
fi #marks the end of the if statement

echo "Line $line_number:"
echo "$line_content"

read -p "Are you sure you want to remove this quote? (y/n): " confirmation

#REPLACED CODE SECTION:
#if [ "$confirmation" = "y" ]; then
#    sed -i "${line_number}d" "$file_path"
#    echo "Quote removed from the file."
#else
#    echo "Removal cancelled."
#fi

for answer in "y" "Y" "yes" "Yes" "YES"; do #uses a for loop to check if the user input matches any of the valid positive answers
    case "$confirmation" in
        $answer ) #check if the value of "confirmation" matches the current value of "answer"
            sed -i "${line_number}d" "$file_path" #if so, uses the "sed" command to delete the specified line in the quotes file
            echo "Quote removed from the file." #informs the user the quote was removed
            ;;
    esac
done

if [[ "$confirmation" != "y" && "$confirmation" != "Y" && "$confirmation" != "yes" && "$confirmation" != "Yes" && "$confirmation" != "YES" ]]; then #checks if "confirmation" does not match any positive response
    echo "Removal cancelled." #informs the user the removal will not take place
fi
