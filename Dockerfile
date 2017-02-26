FROM armv7/armhf-ubuntu:16.10
MAINTAINER Aditya Mukerjee <dev@chimeracoder.net>

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get -qq update --fix-missing && \
    apt-get install -y bash && \
    apt-get install -y mediatomb && \
    rm -rf /var/lib/apt/lists/* && \
    mkdir /.mediatomb && \
    chown -R mediatomb:mediatomb /.mediatomb && \
    chown -R mediatomb:users /media

USER mediatomb

EXPOSE 50500 1900 41570

ENTRYPOINT ["mediatomb"]
CMD ["-p", "50500"]
