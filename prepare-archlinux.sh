cat >> /etc/pacman.conf <<EOF
[archlinuxcn]
Server = https://repo.archlinuxcn.org/\$arch
SigLevel = Never
EOF

pacman -Syu --noconfirm
