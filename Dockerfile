FROM --platform=${TARGETPLATFORM} golang:1.17.8-alpine3.15 AS build
MAINTAINER LEE <info@15099.net>

ARG TARGETARCH
ARG GOPROXY=direct

ENV UPX_VERSION="3.96"

RUN apk add build-base bash make curl git perl ucl-dev zlib-dev \
  && wget https://github.com/upx/upx/releases/download/v${UPX_VERSION}/upx-${UPX_VERSION}-src.tar.xz -P /tmp/ \
  && cd /tmp/ \
  && tar xf upx-${UPX_VERSION}-src.tar.xz \
  && cd upx-${UPX_VERSION}-src \
  && make all \
  && mv ./src/upx.out /usr/bin/upx 
  
  
FROM --platform=${TARGETPLATFORM} alpine:3.16
COPY --from=build /usr/bin/upx /usr/bin/upx

RUN set -ex \
  && apk add --no-cache tzdata ca-certificates bash

ENTRYPOINT ["/bin/bash"]
