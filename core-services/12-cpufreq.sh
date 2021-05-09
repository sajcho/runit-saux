#
# Set CPU and CPUFREQ use mainline kernel
#
# The main Linux kernel for tegra186.
# Running six core to maximum cpufreq crashes the system.
#

if cat /sys/firmware/devicetree/base/model | egrep -q "NVIDIA Jetson TX2 Developer Kit"; then
		msg "Disable CPU Denver cores on NVIDIA Jetson TX2..."
		/bin/echo "0" > /sys/devices/system/cpu/cpu1/online
		/bin/echo "0" > /sys/devices/system/cpu/cpu2/online
fi
