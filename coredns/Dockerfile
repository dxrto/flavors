FROM d.xr.to/base AS builder
RUN xbps-remote go unbound-devel git make gcc
RUN mkdir -p /root/go/src/github.com/coredns
RUN git clone https://github.com/coredns/coredns.git /root/go/src/github.com/coredns/coredns && git -C /root/go/src/github.com/coredns/coredns checkout tags/v1.6.9
RUN cd /root/go/src/github.com/coredns/coredns && echo 'unbound:github.com/coredns/unbound' >> plugin.cfg && sed -i '/\(grpc\|route53\|azure\|clouddns\|k8s_external\|kubernetes\)\:/d' plugin.cfg && sed -i 's:CGO_ENABLED=\$(CGO_ENABLED)::' Makefile
RUN cd /root/go/src/github.com/coredns/coredns && go generate && make

FROM d.xr.to/base
RUN xbps-remote libunbound
COPY --from=builder /root/go/src/github.com/coredns/coredns/coredns coredns
COPY files/Corefile /config/Corefile
WORKDIR "/config"
CMD ["/coredns"]
