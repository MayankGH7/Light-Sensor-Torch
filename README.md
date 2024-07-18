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
```

## Usage

1. Clone this repo using:
``` sh
git clone https://github.com/MayankGH7/Light-Sensor-Torch.git
```

3. Change dir to cloned dir:
``` sh
cd Light-Sensor-Torch
```

4. Run the script using:
``` sh
./flash_automation.sh
```
