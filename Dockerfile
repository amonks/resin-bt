FROM shaunmulligan/arch-armv6h-resin

MAINTAINER Andrew Monks <a@monks.co>

RUN pacman -Sy --noconfirm transmission-cli

ADD settings.json /data/transmission/settings.json

USER transmission-user

EXPOSE 9091
EXPOSE 12345

CMD ["transmission-daemon", "-f", "--config-dir", "/data/transmission", "--log-error"]

