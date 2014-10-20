FROM ubuntu:14.04
MAINTAINER Stephan Buys <stephan.buys@panoptix.co.za>

ENV REFRESHED_ON "19 Sep 2014"
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -qq && apt-get -y install software-properties-common
#RUN add-apt-repository ppa:saltstack/salt
#RUN apt-get update -qq && apt-get install -y salt-master
ADD https://bootstrap.saltstack.com /tmp/install_salt.sh
RUN sh /tmp/install_salt.sh git v2014.7.0rc3
ADD hotrod-master.conf /etc/salt/master.d/

VOLUME ["/pki","/var/cache/salt","/var/log/salt"]
EXPOSE 4505 4506
ENTRYPOINT ["salt-master"]
CMD ["-l","info"]
