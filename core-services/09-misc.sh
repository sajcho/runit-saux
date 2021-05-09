#

install -m0664 -o root -g utmp /dev/null /run/utmp
halt -B  # for wtmp

if [ -z "$VIRTUALIZATION" ]; then
	msg "Initializing random seed..."
	cp /var/lib/random-seed /dev/urandom >/dev/null 2>&1 || true
fi

msg "Setting up loopback interface..."
ip link set up dev lo
