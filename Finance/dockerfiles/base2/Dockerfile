# OS_JDK BASE Image
FROM alpine:3.21

RUN apk update && \
    apk add openjdk21 && \
    apk add libgcc

# add User
RUN \
    addgroup -g 1000 tmax && \
    adduser -D -u 1000 -G tmax tmax

CMD ["/bin/sh","-l"]
