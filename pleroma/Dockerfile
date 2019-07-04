FROM d.xr.to/base AS builder
RUN xbps-install -Syu git gcc make libressl-devel elixir && mkdir /app
ENV HOME=/app/pleroma
ENV MIX_ENV=prod
RUN git clone --depth 1 --branch v0.9.999 https://git.pleroma.social/pleroma/pleroma.git /app/pleroma
WORKDIR /app/pleroma
VOLUME /app/pleroma/uploads
COPY files/run-pleroma /bin/run-pleroma
CMD /bin/run-pleroma
