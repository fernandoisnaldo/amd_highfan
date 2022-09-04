#!/usr/bin/env bash
min_diff=4000
auto_diff=20000 
max_pwm=170 #max value: 255
pwm_mode=$(cat /sys/class/drm/card0/device/hwmon/hwmon0/pwm1_enable)
#get sensors
edge=$(cat /sys/class/drm/card0/device/hwmon/hwmon0/temp1_input)
edge_limit=$(cat /sys/class/drm/card0/device/hwmon/hwmon0/temp1_crit)
junction=$(cat /sys/class/drm/card0/device/hwmon/hwmon0/temp2_input)
junction_limit=$(cat /sys/class/drm/card0/device/hwmon/hwmon0/temp2_crit)
mem=$(cat /sys/class/drm/card0/device/hwmon/hwmon0/temp3_input)
mem_limit=$(cat /sys/class/drm/card0/device/hwmon/hwmon0/temp3_crit)
#compute differences
edge_diff=$[$edge_limit-$edge]
junction_diff=$[$junction_limit-$junction]
mem_diff=$[$mem_limit-$mem]
#high temp test
if [ $edge_diff -le $min_diff ] || [ $junction_diff -le $min_diff ] || [ $mem_diff -le $min_diff ]; then
	echo "1" > /sys/class/drm/card0/device/hwmon/hwmon0/pwm1_enable
	echo "$max_pwm" > /sys/class/drm/card0/device/hwmon/hwmon0/pwm1
#normal temp test
elif [ $edge_diff -ge $auto_diff ] && [ $junction_diff -ge $auto_diff ] && [ $mem_diff -ge $auto_diff ] && [ $pwm_mode -ne 2 ]; then
	echo "2" > /sys/class/drm/card0/device/hwmon/hwmon0/pwm1_enable
fi
