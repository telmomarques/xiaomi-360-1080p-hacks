#!/bin/sh
echo "Xiaomi 360 Hacks enabled"
rm -rf /tmp/factory_mode

#Go only 1 level deep
for f in /mnt/sdcard/x360h/*/*.sh ; do
	sh $f
done;
