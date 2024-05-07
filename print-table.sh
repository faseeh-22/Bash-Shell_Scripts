#!/bin/bash

# Input from user
echo -n "Enter the number-"
read n

# initializing i with 1
i=1
  
# Looping i, i should be less than
# or equal to 10 
while [ $i -le 10 ]
do
    res=$((i * n))

    # printing on console
    echo "$n * $i = $res"
 
    # incrementing i by one  
    ((++i))
  
# end of while loop  
done
