FROM alpine
LABEL maintainer "Dave Curylo <dave@curylo.org>, Michael Hendricks <michael@ndrix.org>"
RUN apk --update add --no-cache curl libarchive readline pcre gmp libressl libedit zlib db unixodbc
RUN apk --update add --no-cache --virtual build-dependencies bash alpine-sdk autoconf libarchive-dev gmp-dev pcre-dev readline-dev libedit-dev libressl-dev zlib-dev db-dev unixodbc-dev linux-headers \
    && apk add geos-dev --update-cache --virtual build-dependencies --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted \
    && git clone https://github.com/SWI-Prolog/swipl-devel \
    && cd swipl-devel && ./prepare --yes && ./configure && make && make install \
    && cd packages && ./configure && make && make install \
    && apk del build-dependencies \
    && cd ../.. && rm -rf swipl-devel
CMD ["swipl"]
