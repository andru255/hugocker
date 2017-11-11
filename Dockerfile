FROM alpine:3.6
MAINTAINER Andrés Muñoz <andru255@gmail.com>

ENV HUGO_VERSION=0.30.2
ENV HUGO_FILE_TAR=hugo_${HUGO_VERSION}_Linux-64bit.tar.gz
ENV SHARED_FOLDER=/usr/local/share
ENV SRC_FOLDER=$SHARED_FOLDER/src

ADD https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/${HUGO_FILE_TAR} /tmp
RUN tar -xf /tmp/${HUGO_FILE_TAR} -C /tmp \
    && mkdir -p /usr/local/sbin \
    && mv /tmp/hugo /usr/local/sbin/hugo \
    && rm -fr /tmp/hugo_${HUGO_VERSION}_linux_amd64 \
    && chmod 775 -R $SHARED_FOLDER \
    && mkdir -p $SRC_FOLDER

RUN apk update \
    && apk upgrade \
    && apk add --no-cache ca-certificates

VOLUME $SRC_FOLDER

EXPOSE 1313
