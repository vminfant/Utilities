#/usr/bin/env bash

for hostnames in $(cat /etc/hosts)
do
	echo $hostnames
done;

