#

[ -n "$VIRTUALIZATION" ] && return 0

msg "Remounting rootfs read-only..."
mount -o remount,ro / || emergency_shell

[ -f /fastboot ] && FASTBOOT=1
[ -f /forcefsck ] && FORCEFSCK="-f"
for arg in $(cat /proc/cmdline); do
	case $arg in
		fastboot) FASTBOOT=1;;
		forcefsck) FORCEFSCK="-f";;
	esac
done

if [ -z "$FASTBOOT" ]; then
	msg "Checking filesystems:"
	fsck -A -T -a -t noopts=_netdev $FORCEFSCK >/dev/null
	if [ $? -gt 1 ]; then
		emergency_shell
	fi
fi

msg "Mounting rootfs read-write..."
mount -o remount,rw / || emergency_shell

msg "Mounting all non-network filesystems..."
mount -a -t "nosysfs,nonfs,nonfs4,nosmbfs,nocifs" -O no_netdev || emergency_shell
