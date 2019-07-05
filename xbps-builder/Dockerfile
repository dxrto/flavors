FROM d.xr.to/base:glibc
COPY files/* /opt/dxrto/
RUN chmod a+x /opt/dxrto/setup-fakedchroot /opt/dxrto/fakedchroot.sh /opt/dxrto/xbps-build && /opt/dxrto/setup-fakedchroot && ln -s /opt/dxrto/xbps-build /bin/xbps-build
WORKDIR '/_workdir'
