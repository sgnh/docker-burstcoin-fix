FROM openjdk:8-jdk-alpine

ADD https://github.com/dawallet/burstcoin/releases/download/1.2.9c/burstcoin-1.2.9c.zip /app/

COPY scripts /app

WORKDIR /app

RUN apk add --no-cache --virtual build unzip && \
    unzip burstcoin-1.2.9c.zip && \
    ln -s /data/burst_db /app/burst_db && \
    apk del --no-cache build

VOLUME /data

EXPOSE 8123 8125

ENTRYPOINT ["/app/start.sh"]
