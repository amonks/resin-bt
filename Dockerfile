FROM shaunmulligan/arch-armv6h-resin

MAINTAINER Andrew Monks <a@monks.co>

RUN mkdir -p /data/downloads \
  && mount /dev/sda1 /data/downloads \
  && RUN mkdir -p /app/transmission/

ADD settings.json /app/transmission/settings.json

RUN pacman -Sy --noconfirm transmission-cli


VOLUME /data/downloads

EXPOSE 9091
EXPOSE 12345

CMD ["transmission-daemon", "-f", "--config-dir", "/app/transmission", "--log-error"]

