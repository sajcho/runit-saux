#

[ -n "$VIRTUALIZATION" ] && return 0

if [ -x /sbin/udevd ]; then
	_udevd=udevd
else
	msg_warn "cannot find udevd!"
fi

if [ -n "${_udevd}" ]; then
	msg "Starting udev and waiting for devices to settle..."
	${_udevd} --daemon
	udevadm trigger --action=add --type=subsystems
	udevadm trigger --action=add --type=devices
	udevadm settle
fi
