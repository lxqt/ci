# The key used by lilac, the build bot for archlinuxcn repo
# https://github.com/archlinuxcn/archlinuxcn-keyring/blob/20220331/master-keyids#L3
lilac_key=83f817213361bf5f02e7e124f9f9fa97a403f63e

cat >> /etc/pacman.conf <<EOF
[archlinuxcn]
Server = https://repo.archlinuxcn.org/\$arch
EOF

# Needed to allow updating archlinux-keyring package (see below).
# This also enables usage of third-party keys [1].
pacman-key --init

curl "https://keyserver.ubuntu.com/pks/lookup?op=get&search=0x$lilac_key" | pacman-key --add -
pacman-key --lsign-key $lilac_key

# Update the keyring first to allow installing packages signed by newer keys [1].
# This may be needed when `pacman -Syu` below or other pacman commands in individual LXQt
# components uses packages signed by newer keys.
pacman -Sy --noconfirm archlinux-keyring

pacman -Syu --noconfirm

# [1] https://gitlab.archlinux.org/archlinux/archlinux-docker/-/issues/18
# [2] https://github.com/lxqt/lxqt-panel/pull/1781#issuecomment-1111755255
