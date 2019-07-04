FROM d.xr.to/base:glibc
COPY files/fakedchroot.sh /_fakedchroot.sh
COPY files/setup-fakedchroot.sh /
RUN bash /setup-fakedchroot.sh && rm /setup-fakedchroot.sh
WORKDIR '/_workdir'
