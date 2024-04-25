

#!/bin/bash


num1=10
num2=20

# Perform addition operation
total=$((num1 + num2))

echo "The result of $num1 + $num2 is: $total"

a=10.5
b=3.2


add_result=$(echo "$a + $b" | bc)

sub_result=$(echo "$a - $b" | bc)

mul_result=$(echo "$a * $b" | bc)

div_result=$(echo "scale=2; $a / $b" | bc)

mod_result=$(echo "$a % $b" | bc)

# Display the results
echo "Addition: $a + $b = $add_result"
echo "Subtraction: $a - $b = $sub_result"
echo "Multiplication: $a * $b = $mul_result"
echo "Division: $a / $b = $div_result"
echo "Modulo: $a % $b = $mod_result"
