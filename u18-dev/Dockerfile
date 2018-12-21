# Ubuntu 18 development docker
# This is based around the gcc7 compiler as this is the one used
# by the pre-compiled ROOT version that's installed here
#
# Tested this is good for PODIO development
#
FROM ubuntu:bionic
LABEL maintainer="Graeme Stewart <graeme.andrew.stewart@cern.ch>"

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get install -y apt-utils
RUN apt-get install -y software-properties-common
RUN apt-get install -y gcc-7 g++-7 gfortran
RUN apt-get install -y cmake cmake-extras cmake-curses-gui git
RUN apt-get install -y libboost1.65 libboost-dev psmisc rapidjson-dev nlohmann-json-dev

RUN apt-get -y install python-yaml python3-yaml
RUN apt-get -y install x11-common x11-utils
RUN apt-get -y install libtbb2 libtbb-dev
RUN apt-get -y install emacs
RUN apt-get -y install doxygen gdb google-perftools libgoogle-perftools-dev zip

## These are some dependencies that Gaudi needs
RUN apt-get -y install librange-v3-dev gsl-bin libgsl-dev libcppunit-1.14-0 libcppunit-dev
RUN apt-get -y install libxerces-c-dev uuid-dev libunwind-dev libunwind8
# libmsgsl-dev is the MS Guidelines Support Library
RUN apt-get -y install libpng-dev libpng16-16 libjemalloc1 libmsgsl-dev


# Add a hsf user to avoid having to use root, add sudo rights
# (passwd "hsf")
RUN apt-get -y install sudo
RUN addgroup --system admin
RUN useradd -G admin -m -p '$6$JmsT1xYM$CdWIKb6aHhqWniaanWDq1Hi9qF4pXJlmsSHrqDDjF8CsYG3w8WyTO4/.xBnG71Zx1aROZ.S.ZoR2BARuB4QBN1' hsf

USER hsf
WORKDIR /home/hsf
CMD ["/bin/bash", "-l"]
