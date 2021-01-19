FROM heroku/heroku:18
MAINTAINER Yegor Bugayenko <yegor256@gmail.com>
LABEL Description="Squid forward proxy with authorization" Vendor="Yegor Bugayenko" Version="0.1"

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update -y
RUN apt-get install -y squid
RUN apt-get clean

COPY entry.sh /
COPY squid.conf /etc/squid/squid.conf
RUN chmod a+x /entry.sh

EXPOSE 443/tcp


ENTRYPOINT ["/entry.sh"]
