#!/bin/bash
iplen=15
namelen=5

cd $(dirname $0)
 
ip_address=$(cat ./target | awk '{print $1}')
machine_name=$(cat ./target | awk '{print $2}')

has_target="false"

if [ $ip_address ] && [ $machine_name ]; then
	has_target="true"
fi

if [[ $1 == "status" ]]; then
	if [[ "$has_target" == "true" ]]; then
		echo "${ip_address:0:iplen} | ${machine_name:0:namelen}"
	else
		echo "No target"
	fi
fi

if [[ $1 == "class" ]]; then
	if [[ "$has_target" == "true" ]]; then
		echo "green"
	else
		echo "red"
	fi
fi
