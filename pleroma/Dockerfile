FROM d.xr.to/base AS builder
RUN xbps-install -Syu git gcc make libressl-devel elixir && mkdir /app
ENV HOME=/app/pleroma
ENV MIX_ENV=prod
RUN git clone --depth 1 --branch v1.0.0 https://git.pleroma.social/pleroma/pleroma.git /app/pleroma
WORKDIR /app/pleroma
VOLUME /app/pleroma/uploads
COPY files/ /bin
CMD /bin/run-pleroma
