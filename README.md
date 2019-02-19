# Xiaomi Mi Camera 360º 1080p Hacks

## What is this?
Provides a way of running custom software on the MJSXJ02CM camera.
Right now it only provides telnet access, but the goal is to add an RSTP server and web interface.

## Warning!
This is still highly experimental stuff. Please make sure you know what you are doing!

## Instructions
0. Make sure your camera is already configured (connected to your network)
1. Clone/download this repository
2. Copy the "manu_test" and "x360h" folders to the root of the SD Card
3. Power off the camera and insert the SD Card
4. Power on the camera
5. Look for the IP address of the camera on your routers DHCP table and telnet into it
6. Username is "root" (no quotes), and there is no password

## I want to contribute with a hack!
Awesome, thank you!

Create a new folder inside "x360h" and put an `.sh` script inside. It will be automatically executed on boot. You can also put other resources inside your folder (like any armv7 executable), and use your `.sh` script as an entry point.

Finally, make a pull request.