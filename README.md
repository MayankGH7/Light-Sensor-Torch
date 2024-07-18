# Light Sensor Torch Control Script

This script uses the Termux environment on Android to control the device's torch based on light sensor readings. The torch turns on in darkness and turns off in bright environments.

## Requirements

Ensure the following packages are installed in Termux:
- `jq`
- `termux-sensor`
- `termux-torch`

You can install them using:
```sh
pkg install jq
pkg install termux-api
