FROM d.xr.to/base
LABEL authors="krageon <krageon@gmail.com>"
RUN xbps-remote umurmur

COPY files/umurmur.conf /etc/umurmur/umurmur.conf
RUN chown -R umurmur:umurmur /etc/umurmur/

EXPOSE 64738/tcp
EXPOSE 64738/udp

USER umurmur
CMD umurmurd -d -c /etc/umurmur/umurmur.conf
