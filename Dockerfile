FROM shaunmulligan/arch-armv6h-resin

MAINTAINER Andrew Monks <a@monks.co>

RUN mkdir -p home/transmission/

ADD settings.json /home/transmission/settings.json

RUN pacman -Sy --noconfirm transmission-cli

EXPOSE 9091
EXPOSE 12345

CMD ["transmission-daemon", "-f", "--config-dir", "/home/transmission", "--log-error"]

