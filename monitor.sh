#!/bin/bash

usage=$(df / | grep / | awk '{print $5}' | sed 's/%//')

if [ "$usage" -gt 80 ]; then
	echo "DISK UTILIZATION IS AT ${usage}%!!" | mail -s "YOUR DISK IS UTILISING MORE THAN 80%" aditya170405@gmail.com
else
	echo " Disk Utilization under control "
fi

