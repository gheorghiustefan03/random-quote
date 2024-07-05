#!/bin/bash

pth="./quotes.txt" #places the quotes file path in a variable

text=$(shuf -n 1 "$pth") #randomly selects a line from the quotes file using the "shuf" command and stores it in the "text" variable

echo "Random Quote:"
echo "$text" #prints the value in the "text" variable
