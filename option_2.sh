#!/bin/bash

path="./quotes.txt" #places quotes text file relative path in a variable called "path"

read -p "Enter a new quote: " quote #prompt the user to enter a new quote and store it in the "quote" variable

echo "$quote" >> "$path" #appends the quote entered at the end of the file in the "path" variable
echo "'$quote' added" #informs the user their quote was added
