# Ubuntu 20 development docker
#
FROM ubuntu:focal
LABEL maintainer="Graeme Stewart <graeme.andrew.stewart@cern.ch>"

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get install -y apt-utils
RUN apt-get install -y software-properties-common
RUN apt-get install -y gcc-9 g++-9 gfortran
RUN apt-get install -y cmake cmake-extras cmake-curses-gui git
RUN apt-get install -y libboost1.71 psmisc nlohmann-json3-dev

RUN apt-get -y install python3-yaml
RUN apt-get -y install libtbb2 libtbb-dev
RUN apt-get -y install emacs
RUN apt-get -y install doxygen gdb google-perftools libgoogle-perftools-dev zip
RUN apt-get -y install clang-format clang-tidy

# Add a hsf user to avoid having to use root, add sudo rights
# (passwd "hsf")
RUN apt-get -y install sudo
RUN addgroup --system admin
RUN useradd -G admin -m -p '$6$JmsT1xYM$CdWIKb6aHhqWniaanWDq1Hi9qF4pXJlmsSHrqDDjF8CsYG3w8WyTO4/.xBnG71Zx1aROZ.S.ZoR2BARuB4QBN1' hsf

USER hsf
WORKDIR /home/hsf
CMD ["/bin/bash", "-l"]
