# Xiaomi Mi Camera 360º 1080p Hacks

![Xiaomi Mi Home Security Camera 360º 1080P MJSXJ02CM](images/MJSXJ02CM.jpg)

## What is this?
Provides a way of running custom software on the MJSXJ02CM camera.
Right now it only provides telnet access, but the goal is to add an RSTP server and web interface.

## Warning!
**This is still highly experimental stuff. Please make sure you know what you are doing!**

## Instructions
This exploits a security flaw in 3.4.2_0062 firmware. If your camera has a more recent firmware you need to downgrade.

Follow the below steps in order.

### View camera firmware version
1. Configure the camera using the Mi Home app
2. Open the camera in the app and touch the 3 dots in the upper right corner
3. Select the option "General Settings", and then "Check for firmware upgrades"
4. If you see "Current version 3.4.2_0062" then you're good to go, jump to ["Install the hacks"](#install-the-hacks) below.
5. If you see another version you need to downgrade, jump to ["Downgrade the camera"](#downgrade-the-camera) below.

### Downgrade the camera
**You will lose all the camera configurations!**

Please be careful!

Do not power down the camera while flashing!

Make sure you understand all the steps before continuing!

1. Grab tf_recovery.bin file from [here](https://github.com/telmomarques/xiaomi-360-1080p-hacks/raw/master/firmware/3.4.2_0062/tf_recovery.img).
2. Put the file in the root of your SD Card (don't change the name!)
3. Power down the camera and insert the SD Card
4. Power on the camera and wait, the led will be a solid yellow while the firmware is flashing
6. When the led turns blue (blinking or solid) the camera is ready
7. Jump to ["Install the hacks"](#install-the-hacks) below.

### Install the hacks
1. Configure the camera using the Mi Home app
2. Clone/download this repository
3. Copy the **contents** of "sdcard" folder to the root of your SD Card
4. Power off the camera and insert the SD Card
5. Power on the camera
6. Look for the IP address of the camera on your router's DHCP table and telnet into it (for now, telnet is automatically active)
7. Username is "root" (no quotes), and there is no password

## I want to contribute with a hack!
Awesome, thank you!

Create a new folder inside "x360h" and put an `.sh` script inside. It will be automatically executed on boot. You can also put other resources inside your folder (like any armv7 executable), and use your `.sh` script as an entry point.

Finally, make a pull request.