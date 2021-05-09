#

msg "Create descriptor symlink..."
[ -e /dev/fd ]     || ln -snf /proc/self/fd /dev/fd
[ -e /dev/stdin ]  || ln -snf /proc/self/fd/0 /dev/stdin
[ -e /dev/stdout ] || ln -snf /proc/self/fd/1 /dev/stdout
[ -e /dev/stderr ] || ln -snf /proc/self/fd/2 /dev/stderr
