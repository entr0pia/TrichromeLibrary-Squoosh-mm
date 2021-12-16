#!/system/bin/sh
# Do NOT assume where your module will be located.
# ALWAYS use $MODDIR if you need to know where this script
# and module is placed.
# This will make sure your module will still work
# if Magisk change its mount point in the future
MODDIR=${0%/*}

# This script will be executed in late_start service mode
sleep 15
trib_vers=$(find /data/app -name  'com.google.android.trichromelibrary*' | grep -oE '[0-9]{9}' | sort -n | sed '$d')
for version in $trib_vers; do
    pm uninstall com.google.android.trichromelibrary_$version
done
