# rpi_ble_server

Build a bluetooth low enery service for a Raspberry Pi.

Build images to compile the ble server - written in Rust, and an
image to run rpi-image gen to build a raspberry pi image

clone this repository and run the build script

```sh
git clone https://github.com/jonnymacs/rpi-with-splash-screen
cd rpi-with-splash-screen
./build.sh
```

## if you are on intel chip you need to execute the commands in the build script and make this change in the rpi image gen container
```bash
$sudo su
$mount binfmt_misc -t binfmt_misc /proc/sys/fs/binfmt_misc && echo 1 > /proc/sys/fs/binfmt_misc/status
$exit
```

Use the Raspberry Pi Imager tool to install the img file located in deploy
on an SD card or USB stick.

Observe the blockchain animation on the screen at boot.

[![Watch and Like the recorded video for this project on YouTube](https://img.youtube.com/vi/K41W-7Vu7mY/maxresdefault.jpg)](https://www.youtube.com/watch?v=K41W-7Vu7mY)

**[Watch and Like the recorded video for this project on YouTube](https://www.youtube.com/watch?v=K41W-7Vu7mY)** 

**[Subscribe to the channel for more similar content](https://www.youtube.com/@macmind-io?sub_confirmation=1)

Please refer to https://github.com/raspberrypi/rpi-image-gen for more information rpi-image-gen

[Follow me on X](https://x.com/jonnymacs), and don't forget to star [this GitHub repository](https://github.com/jonnymacs/rpi_ble_server)!