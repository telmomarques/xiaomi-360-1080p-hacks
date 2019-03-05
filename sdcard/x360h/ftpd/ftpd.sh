#!/bin/sh
echo "Starting FTP server"
/mnt/sdcard/x360h/busybox/busybox tcpsvd -vE 0.0.0.0 21 /mnt/sdcard/x360h/busybox/busybox ftpd -w /
