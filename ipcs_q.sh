#!/bin/bash

# Define a function to convert hexadecimal to decimal
hex_to_dec() {
  echo $(printf "%d" $1)
}

# Print the table header
printf "%-11s %-9s %-9s %-9s %-12s %-9s\n" "key" "msqid" "owner" "perms" "used-bytes" "messages"

# Read data from ipcs -q command
ipcs -q | tail -n +4 | while read -r key msqid owner perms used_bytes messages; do
  # Convert the hexadecimal key to decimal
  key_dec=$(hex_to_dec $key)

  # Print the data in the desired format
  printf "%-11s %-9s %-9s %-9s %-12s %-9s\n" $key_dec $msqid $owner $perms $used_bytes $messages
done