FROM shaunmulligan/arch-armv6h-resin

RUN pacman -Sy --noconfirm transmission-cli

RUN systemctl enable transmission.service \
  && systemctl start transmission.service
