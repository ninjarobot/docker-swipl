FROM debian:jessie

MAINTAINER Michael Hendricks <michael@ndrix.org>

# prepare OS
RUN apt-get update
RUN apt-get dist-upgrade -y
RUN apt-get install -y libarchive13 libgmp10 libossp-uuid16 libssl1.0.0 libdb5.3 libpcre3 libedit2 libgeos++ libspatialindex3 unixodbc odbc-postgresql tdsodbc libmyodbc

# add SWI Prolog to PATH
ADD swipl-binary.tgz .
RUN cd bin && ln -s /swipl/bin/swipl swipl
CMD swipl
