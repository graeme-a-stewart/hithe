# Ubuntu 18 development docker
# This is based around the gcc7 compiler as this is the one used
# by the pre-compiled ROOT version that's installed here
#
# Tested this is good for PODIO development
# N.B. Download the ROOT tarball from https://root.cern.ch/content/release-61404
#
FROM ubuntu:bionic
LABEL maintainer="Graeme Stewart <graeme.andrew.stewart@cern.ch>"

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get install -y software-properties-common
RUN apt-get install -y gcc-7 g++-7 cmake cmake-extras cmake-curses-gui libboost1.65 libboost-dev git psmisc rapidjson-dev
RUN apt-get -y install apt-utils

RUN apt-get -y install python-yaml python3-yaml
RUN apt-get -y install x11-common x11-utils
RUN apt-get -y install libtbb2 libtbb-dev
RUN apt-get -y install emacs
RUN apt-get -y install doxygen gdb google-perftools libgoogle-perftools-dev zip

COPY root_v6.14.04.Linux-ubuntu18-x86_64-gcc7.3.tar.gz /tmp
WORKDIR /opt
RUN tar -xvzf /tmp/root_v6.14.04.Linux-ubuntu18-x86_64-gcc7.3.tar.gz
RUN rm -f /tmp/root_v6.14.04.Linux-ubuntu18-x86_64-gcc7.3.tar.gz

WORKDIR /tmp
