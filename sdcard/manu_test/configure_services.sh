#!/bin/sh

HACKS_DIR=/mnt/sdcard/hacks
SERVICES_DIR=/mnt/data/etc/runit

rm -rf ${SERVICES_DIR}

for hack in ${HACKS_DIR}/* ; do
	if [ -d ${hack} ]; then
		hackName=`basename $hack`
		for serviceDir in ${hack}/meta/service ; do
			if [ -d ${serviceDir} ]; then
				cd ${serviceDir}
				
				if [ -f ${serviceDir}/.enable ]; then
					for service in ${serviceDir}/* ; do
						serviceName=`basename ${service}`
						hackServiceDir=${SERVICES_DIR}/${hackName}-${serviceName}
						mkdir -p ${hackServiceDir}
						cp ${service} ${hackServiceDir}/run
					done
				fi
			fi
		done;
	fi
done;

export PATH=$PATH:${HACKS_DIR}/runit/bin
runsvdir ${SERVICES_DIR} & 
