#!/bin/bash

# Initialize decimal numbers
num1=10.5
num2=3.2

# Addition
addition_result=$(echo "$num1 + $num2" | bc)

# Subtraction
subtraction_result=$(echo "$num1 - $num2" | bc)

# Multiplication
multiplication_result=$(echo "$num1 * $num2" | bc)

# Division
division_result=$(echo "scale=2; $num1 / $num2" | bc)

# Modulo
modulo_result=$(echo "$num1 % $num2" | bc)

# Display the results
echo "Addition: $num1 + $num2 = $addition_result"
echo "Subtraction: $num1 - $num2 = $subtraction_result"
echo "Multiplication: $num1 * $num2 = $multiplication_result"
echo "Division: $num1 / $num2 = $division_result"
echo "Modulo: $num1 % $num2 = $modulo_result"
