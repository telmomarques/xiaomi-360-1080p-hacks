# This project is no longer being maintained.

If you're looking for mjsxj05cm check this project: https://github.com/cmiguelcabral/mjsxj05cm-hacks

For mjsxj02cm keep reading.

[![discord](https://img.shields.io/discord/713125176971231233?label=discord)](http://discord.gg/qggupzu)

# Mi Camera Hacks

- [Supported Cameras](#supported-cameras)
- [Features](#features)
- [Install Instructions](#install-instructions)
- [FAQ](#faq)
- [These Guys are Awesome](#these-guys-are-awesome)

# 📹 RTSP Is Here!
![RTSP is happening](images/itshappening.gif)

Keep calm and follow the procedure!

Seriously now: it's still in beta, please read everything before continuing.

## Supported Cameras
⚠️⚠️⚠️⚠️⚠️ DO NOT FLASH IF THE MODEL NAME DOESN'T MATCH ⚠️⚠️⚠️⚠️⚠️

⚠️⚠️⚠️⚠️⚠️ IT WILL SOFTBRICK THE CAMERA ⚠️⚠️⚠️⚠️⚠️

For now this is it...

Model Name(s) | Picture
--- | ---
MJSXJ02CM|![MJSXJ02CM](images/MJSXJ02CM.jpg)


## Features
### Feature list
- RTSP Server
- Web Configuration Interface
- SSH Server
- SFTP Server

## Install Instructions
The hacks exploits a flaw in firmware version 3.4.2_0062, **please read the instructions very carefully!!**

- First [Check your camera firmware version](#view-camera-firmware-version)

- If you have firmware version 3.4.2_0062, go to [Install the hacks](#install-the-hacks)

- If you have another firmware version, go to [Downgrade the Firmware](#downgrade-the-firmware)

### View camera firmware version
1. Configure the camera using the Mi Home app
2. Open the camera in the app and touch the 3 dots in the upper right corner
3. Select the option "General Settings", and then "Check for firmware upgrades"
4. The current firmware version is presented on the screen

### Downgrade the Firmware
**You will lose the camera configuration!**

⚠️ Please be careful!

⚠️ Do not power down the camera while flashing!

⚠️ Make sure you understand all the steps before continuing!

1. Grab tf_recovery.bin file from [here](https://github.com/telmomarques/xiaomi-360-1080p-hacks/raw/master/firmware/3.4.2_0062/tf_recovery.img).
2. Put the file in the root of your SD Card (don't change the name!)
3. Power down the camera and insert the SD Card
4. Power on the camera and wait, the led will be a solid yellow while the firmware is flashing (this will take several minutes!)
6. When the camera starts rotating and asking for the QR code, it's done.
7. Go to ["Install the hacks"](#install-the-hacks) below.

### Install the hacks
1. Configure the camera using the Mi Home app
2. Download the latest release from [releases](https://github.com/telmomarques/xiaomi-360-1080p-hacks/releases)
3. Copy the **contents** of "sdcard" folder to the root of your SD Card
4. Power off the camera and insert the SD Card
5. Power on the camera
6. Find the IP address of your camera
7. Open the web config interface o the camrea on your browser: [http://<your-camera-ip/](http://<your-camera-ip/)

## FAQ

### I can't downgrade the firmware, I follow the instructions but nothing happens.
Thy another SD Card. This actually happens a lot, trying a different SD Card usually solves it.

### The RTSP stream is corrupted / stops working after a while.
The RTSP server is still in alpha stage.

You may see some corrupted frames here and there, and the server may stop working after a few hours (restarting the camera solves it). We're working on it, but if a 100% stable video stream is **critical** for you, then it's still not ready.

### I'm worried about security, can I create/modify the [hack] password?

Security is in the roadmap, but still not the primary focus. Right now you'll have to secure the camera by making sure it's only accessible on your private network, and that your network is secure.

## These Guys are Awesome
Huge thanks to everyone who contributed!

[@aslafy-z](https://github.com/aslafy-z)
[@crckmc](https://github.com/crckmc)
[@thewh1teagle](https://github.com/thewh1teagle)
