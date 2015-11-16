FROM shaunmulligan/arch-armv6h-resin

RUN pacman -Sy --noconfirm transmission-cli

RUN transmission-daemon
