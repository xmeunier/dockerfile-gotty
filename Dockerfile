FROM alpine:3.4

EXPOSE 8080

RUN apk add --update go git && \
  go version && \
  go get github.com/yudai/gotty && \
  apk del go git && \
  rm -rf /var/cache/apk/*

ENTRYPOINT ["/usr/local/bin/gotty"]
CMD ["--permit-write","--reconnect","/bin/sh"]
