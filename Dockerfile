FROM ubuntu:15.04

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y \
      dialog \
      ubuntu-device-flash

COPY build.sh /build.sh
CMD /build.sh
