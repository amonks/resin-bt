FROM yyolk/rpi-archlinuxarm:latest

RUN pacman -Syu \
  && pacman -S transmission-cli \
  && systemctl enable transmission.service \
  && systemctl start transmission.service
