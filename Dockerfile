FROM alpine
LABEL maintainer "Dave Curylo <dave@curylo.org>, Michael Hendricks <michael@ndrix.org>"
RUN apk --update add --no-cache curl libarchive readline pcre gmp libressl libedit zlib db unixodbc libuuid \
    && apk --update add --no-cache --virtual build-dependencies bash alpine-sdk autoconf libarchive-dev gmp-dev pcre-dev readline-dev libedit-dev libressl-dev zlib-dev db-dev unixodbc-dev linux-headers \
    && apk add geos-dev --update-cache --virtual build-dependencies --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted \
    && curl -O http://www.swi-prolog.org/download/devel/src/swipl-7.5.6.tar.gz \
    && echo "47c31d4d3140e96706295555b01916dd7bde6c4151c80515a48e7aabfc747288  swipl-7.5.6.tar.gz" >> swipl-7.5.6.tar.gz-CHECKSUM \
    && sha256sum -c swipl-7.5.6.tar.gz-CHECKSUM \
    && tar -xzf swipl-7.5.6.tar.gz \
    && cd swipl-7.5.6 && ./configure && make && make install \
    && cd packages && ./configure && make && make install \
    && apk del build-dependencies \
    && cd ../.. && rm -rf swipl-7.5.6.tar.gz swipl-7.5.6.tar.gz-CHECKSUM swipl-7.5.6
CMD ["swipl"]
