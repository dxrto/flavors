FROM dxrto/base
LABEL authors="krageon <krageon@gmail.com>"
RUN xbps-install -Sy umurmur

COPY files/umurmur.conf /etc/umurmur/umurmur.conf

EXPOSE 64738

USER umurmur
CMD umurmurd -c /etc/umurmur/umurmur.conf