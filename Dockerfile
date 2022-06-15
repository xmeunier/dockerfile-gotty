FROM golang:alpine

EXPOSE 8080

RUN apk add --update git && \
  go version && \
  which go && \
  export -p && \
  go mod init && \
  go get github.com/yudai/gotty && \
  export PATH=$PATH:$GOPATH/bin && \
  apk del go git && \
  rm -rf /var/cache/apk/*

ENTRYPOINT ["/usr/local/bin/gotty"]
CMD ["--permit-write","--reconnect","/bin/sh"]
