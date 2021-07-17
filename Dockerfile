FROM golang:alpine

ENV HUGO_VERSION 0.85.0
RUN apk add --no-cache nodejs npm curl gcc libc-dev g++ git && \
  rm -rf /var/cache/apk/* && \
  curl -Lf -o hugo.zip https://github.com/gohugoio/hugo/archive/v${HUGO_VERSION}.zip && \
  unzip hugo.zip && \
  cd hugo-${HUGO_VERSION} && \
  GOBIN=/usr/local/bin go install -tags extended && \
  cd .. && rm -fr hugo*

