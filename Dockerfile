FROM alpine
LABEL maintainer "Dave Curylo <dave@curylo.org>, Michael Hendricks <michael@ndrix.org>"
RUN SWIPL_VER=7.5.6 && \
    SWIPL_CHECKSUM=47c31d4d3140e96706295555b01916dd7bde6c4151c80515a48e7aabfc747288 \
    && apk --update add --no-cache curl libarchive readline pcre gmp libressl libedit zlib db unixodbc libuuid \
    && apk --update add --no-cache --virtual build-dependencies bash alpine-sdk autoconf libarchive-dev gmp-dev pcre-dev readline-dev libedit-dev libressl-dev zlib-dev db-dev unixodbc-dev util-linux-dev linux-headers \
    && apk add geos-dev --update-cache --virtual build-dependencies --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted \
    && curl -O http://www.swi-prolog.org/download/devel/src/swipl-$SWIPL_VER.tar.gz \
    && echo "$SWIPL_CHECKSUM  swipl-$SWIPL_VER.tar.gz" >> swipl-$SWIPL_VER.tar.gz-CHECKSUM \
    && sha256sum -c swipl-$SWIPL_VER.tar.gz-CHECKSUM \
    && tar -xzf swipl-$SWIPL_VER.tar.gz \
    && cd swipl-$SWIPL_VER && ./configure && make && make install \
    && cd packages && ./configure && make && make install \
    && apk del build-dependencies \
    && cd ../.. && rm -rf swipl-$SWIPL_VER.tar.gz swipl-$SWIPL_VER.tar.gz-CHECKSUM swipl-$SWIPL_VER
CMD ["swipl"]
