FROM shaunmulligan/arch-armv6h-resin

RUN pacman -Sy --noconfirm transmission-cli

EXPOSE 9091
EXPOSE 12345

CMD ["transmission-daemon"]
