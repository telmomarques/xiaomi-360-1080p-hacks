#!/bin/sh

HACKS_DIR=/mnt/sdcard/hacks
SERVICES_DIR=/mnt/data/etc/runit

for hack in ${HACKS_DIR}/* ; do

	if [ -d ${hack} ]; then
		hackName=`basename $hack`
		
		for service in ${hack}/meta/service ; do
			if [ -f ${service}/run ]; then
				hackServiceDir=${SERVICES_DIR}/${hackName}
				mkdir -p ${hackServiceDir}
				cp ${service}/* ${hackServiceDir}
			fi
		done;
	fi
done;

export PATH=$PATH:${HACKS_DIR}/runit/bin

runsvdir ${SERVICES_DIR} & 
