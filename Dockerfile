FROM golang:alpine
LABEL maintainer="info@warpnet.nl" \
      repo="https://github.com/warpnet/hugo-extended"
ENV HUGO_VERSION 0.131.0
# hadolint ignore=DL3018,DL3003
RUN set -eux \
    && apk add --no-cache nodejs npm curl gcc libc-dev g++ git \
    && rm -rf /var/cache/apk/* \
    && curl -Lf -o hugo.zip https://github.com/gohugoio/hugo/archive/v${HUGO_VERSION}.zip \
    && unzip hugo.zip \
    && cd hugo-${HUGO_VERSION} \
    && GOBIN=/usr/local/bin go install --tags extended \
    && cd .. && rm -rf hugo* \

WORKDIR /data
ENTRYPOINT ["hugo", "server", "-D", "--bind", "0.0.0.0"]
