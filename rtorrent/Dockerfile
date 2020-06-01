FROM d.xr.to/base
RUN xbps-remote rtorrent
COPY files/rtorrent.rc /data/rtorrent.rc
VOLUME ["/data"]
WORKDIR "/data"
CMD ["rtorrent", "-n", "-o", "system.daemon.set=true", "-o", "import=/data/rtorrent.rc", "-s", "/data"]
