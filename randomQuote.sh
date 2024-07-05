#!/bin/bash

echo #displays blank line

echo "Welcome to Random Quote Generator!"
while true; do #initiates an infinite loop for indefinite displaying of the main menu
echo "Main menu:"
echo "1. Read Random Quote"
echo "2. Add New Quote"
echo "3. Remove a quote"
echo "4. Display all quotes"
echo "5. Exit"

read -p "Enter your choice: " option #prompt the user for their choice

case $option in #initiates a case statement for executing the appropriate script based on user input
  1) #commands to be run in case input is '1':
    . ./option_1.sh #calls the "option_1.sh" script
    ;;
  2)
    . ./option_2.sh
    ;;
  3)
    . ./option_3.sh
    ;;
  4)
    nl ./quotes.txt #prints the contets of the "quotes.txt" file with numbered lines
    ;;
  5)
    echo "Exiting..."
    exit 0 #exits with code 0 (no errors)
    ;;
  *) #commands to be run in case input is not any of the previously mentioned cases:
    echo "Invalid choice"
    ;;
esac #ends case statement

done #marks the end of the while loop
