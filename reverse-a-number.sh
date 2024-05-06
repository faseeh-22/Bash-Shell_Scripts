
	
#!/bin/bash
 
echo "Enter a number"
read num
reverse=0
 
while [ $num -gt 0 ]
do
    remainder=$(( $num % 10 )) 
    reverse=$(( $reverse * 10 + $remainder )) 
    num=$(( $num / 10 )) 
done
 
echo "Reversed number is : $reverse"



### Explanation of the script ###

#    `#!/bin/bash`: This line is known as a shebang. It is used to tell the system that this script needs to be executed using bash shell.
#    `echo “Enter a number”`: This line is used to print the message “Enter a number” to the console.
#    `read num`: This line reads the user input from the console and stores it in the variable ‘num’.
#    `reverse=0`: This line initializes the variable ‘reverse’ to 0. This variable will store the final reversed number.
#    `while [ $num -gt 0 ]`: This line starts a while loop which will continue as long as the value in ‘num’ is greater than 0.
#    `remainder=$(( $num % 10 ))`: This line calculates the remainder when ‘num’ is divided by 10. This gives the last digit of ‘num’.
#    `reverse=$(( $reverse * 10 + $remainder ))`: This line calculates the new reverse number. It multiplies the current ‘reverse’ value by 10 and adds the 
#    ‘remainder’ to it.
#    `num=$(( $num / 10 ))`: This line updates the value of ‘num’. It divides ‘num’ by 10 to remove the last digit.
#    `done`: This keyword ends the while loop.
#    `echo “Reversed number is : $reverse”`: This line prints the reversed number to the console. 



### Running the Script ###

#    you can run your script with the following command:

#    ./reverse_num.sh 

# You should see a prompt asking you to enter a number. After inputting a number and hitting enter, you’ll see the reverse of the number you provided.
