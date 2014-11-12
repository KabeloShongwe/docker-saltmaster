FROM ubuntu:14.04.1
MAINTAINER Stephan Buys <stephan.buys@panoptix.co.za>

ENV REFRESHED_ON "12 Nov 2014"
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -qq && apt-get -y install software-properties-common
RUN apt-get -y install python-git
ADD install_salt.sh /tmp/
RUN sh /tmp/install_salt.sh -M -N git v2014.7.0
ADD hotrod-master.conf /etc/salt/master.d/

VOLUME ["/pki","/var/cache/salt","/var/log/salt"]
EXPOSE 4505 4506
ENTRYPOINT ["salt-master"]
CMD ["-l","info"]
