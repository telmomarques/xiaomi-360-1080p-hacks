#!/bin/sh

HACKS_DIR=/mnt/sdcard/hacks
SERVICES_DIR=/mnt/data/etc/runit

install_service() {
	hackName=$1
	serviceDir=${HACKS_DIR}/${hackName}/meta/service

	if [ -d ${serviceDir} ] && [ -f ${serviceDir}/.enable ]; then
		cd ${serviceDir}
		
		for service in ${serviceDir}/* ; do
			serviceName=`basename ${service}`
			hackServiceDir=${SERVICES_DIR}/${hackName}-${serviceName}
			mkdir -p ${hackServiceDir}
			cp ${service} ${hackServiceDir}/run
		done
	fi
}

install_services() {
	rm -rf ${SERVICES_DIR}

	for hack in ${HACKS_DIR}/* ; do
		if [ -d ${hack} ]; then
			hackName=`basename $hack`
			install_service ${hackName}
		fi
	done;

	export PATH=$PATH:${HACKS_DIR}/runit/bin
	runsvdir ${SERVICES_DIR} &
}

if [ -z $1 ]; then
	install_services
else
	install_service $1
fi