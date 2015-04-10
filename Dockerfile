FROM ubuntu:14.04.1
MAINTAINER Stephan Buys <stephan.buys@panoptix.co.za>

ENV REFRESHED_ON "10 Apr 2015"
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -qq && apt-get -y install software-properties-common
RUN add-apt-repository ppa:saltstack/salt
RUN apt-get update -qq && apt-get install -y salt-master
ADD hotrod-master.conf /etc/salt/master.d/
ADD cluster.sh /usr/bin/cluster.sh

VOLUME ["/pki","/var/cache/salt","/var/log/salt"]
EXPOSE 4505 4506
ENTRYPOINT ["salt-master"]
CMD ["-l","info"]
