#!/bin/bash

# Initialize the variable
counter=2

# Loop from 0 to 100
while [ $counter -le 100 ]; do
	echo "Counter: $counter"
	sudo cp /bin/ls /tmp/test/ls${counter}
	sudo chmod 777 /tmp/test/ls${counter}
	/tmp/test/ls$((counter - 1))
	if [ $? -ne 0 ]; then
		echo "The command failed!"
		exit 1
	fi

	sleep 1

	# Increment the counter
	((counter++))

	# You can add additional commands or sleep here if needed
	# For example, sleep 1  # to pause for 1 second
done
