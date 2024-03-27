#!/bin/zsh

# Check if argument is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <duration_in_seconds>"
  exit 1
fi

duration=$1

# Validate duration
if ! [[ $duration =~ ^[0-9]+$ ]]; then
  echo "Invalid duration. Please provide a valid number of seconds."
  exit 1
fi

# Countdown function
countdown() {
  local remaining=$1
  while [ $remaining -gt 0 ]; do
    echo -ne "Remaining: $remaining seconds\033[0K\r"
    sleep 1
    ((remaining--))
  done
  echo "Countdown complete! \n continueing..."
}

countdown $duration

