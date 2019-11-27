ARG ALPINE_VERSION
FROM alpine:${ALPINE_VERSION:-3.10}

MAINTAINER "System Engineer (SysEng)"

ENV S6OVERLAY_VERSION=1.22.1.0 \
    S6_BEHAVIOUR_IF_STAGE2_FAILS=1

RUN apk update && \
    apk upgrade && \
    apk add bash bind-tools ca-certificates curl jq tar && \
    curl -sSL https://github.com/just-containers/s6-overlay/releases/download/v${S6OVERLAY_VERSION}/s6-overlay-amd64.tar.gz | \
        tar xz -C / && \
    apk del tar && \
    rm -rf /var/cache/apk/*
