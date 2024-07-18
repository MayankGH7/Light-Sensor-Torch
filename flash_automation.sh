#!/bin/bash

for cmd in jq termux-sensor termux-torch; do
  if ! command -v $cmd &> /dev/null; then
    echo "$cmd could not be found. Please install it first."
    exit 1
  fi
done

is_on=0
is_off=1

while true; do
  sensor_output=$(termux-sensor -s LIGHT -n 1 2>/dev/null)
  
  if [ $? -ne 0 ]; then
    echo "Failed to get sensor data."
    continue
  fi

  light=$(echo "$sensor_output" | jq -r ".LIGHT.values[0]" 2>/dev/null)

  if [ -z "$light" ]; then
    echo "Failed to parse sensor data."
    continue
  fi

  if [ "$light" -eq 0 ]; then
    if [ $is_on -eq 0 ]; then
      termux-torch on
      if [ $? -eq 0 ]; then
        echo -e "\033[1;32mTorch on\033[0m"
        is_on=1
        is_off=0
      else
        echo "Failed to turn on the torch."
      fi
    fi
  else
    if [ $is_off -eq 0 ]; then
      termux-torch off
      if [ $? -eq 0 ]; then
        echo -e "\033[1;31mTorch off\033[0m"
        is_off=1
        is_on=0
      else
        echo "Failed to turn off the torch."
      fi
    fi
  fi

  sleep 1
done
