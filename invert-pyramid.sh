#!/bin/bash

# Define the number of lines for the pyramid
num_lines=5

for((i=num_lines; i>=1; i--))
do
    # Print leading spaces
    for((j=i; j<num_lines; j++))
    do
        echo -n " "
    done

    # Print numbers
    for((j=1; j<=2*i-1; j++))
    do
        echo -n "$i"
    done

    # Move to the next line
    echo
done
