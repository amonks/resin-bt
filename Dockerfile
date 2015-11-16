FROM shaunmulligan/arch-armv6h-resin

MAINTAINER Andrew Monks <a@monks.co>

RUN useradd transmission-user

ADD settings.json /home/transmission-user/settings.json

RUN pacman -Sy --noconfirm transmission-cli

USER transmission-user

EXPOSE 9091
EXPOSE 12345

CMD ["transmission-daemon", "-f", "--config-dir", "/home/transmission", "--log-error"]

