FROM alpine:3.20

ARG TARGETARCH=amd64
ARG WIREPROXY_VERSION=1.1.2

RUN wget -qO- "https://github.com/pufferffish/wireproxy/releases/download/v${WIREPROXY_VERSION}/wireproxy_linux_${TARGETARCH}.tar.gz" \
    | tar -xz -C /usr/local/bin wireproxy

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 1080
ENTRYPOINT ["/entrypoint.sh"]
