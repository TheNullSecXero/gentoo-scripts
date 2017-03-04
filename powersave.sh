#!/bin/bash

echo " [+] Setting SCSI power policy"
for i in /sys/class/scsi_host/*/link_power_management_policy; do echo 'min_power' > $i; done

echo " [+] Setting USB powersaving options"
for i in /sys/bus/usb/devices/*/power/control; do echo 'auto' > $i; done
for i in /sys/bus/usb/devices/*/power/autosuspend; do echo 1 > $i; done

echo " [+] Setting PCI powersaving options"
for i in /sys/bus/pci/devices/*/power/control; do echo 'auto' > $i; done

echo " [+] Setting additional powersaving options"
echo 2 > /sys/class/backlight/acpi_video0/brightness
echo 5 > /proc/sys/vm/laptop_mode
echo 1 > /sys/devices/system/cpu/sched_mc_power_savings
echo 1500 > /proc/sys/vm/dirty_writeback_centisecs
echo 1 > /sys/module/snd_hda_intel/parameters/power_save

