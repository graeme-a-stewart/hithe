# Ubuntu 16 development docker
FROM ubuntu:xenial
LABEL maintainer="Graeme Stewart <graeme.andrew.stewart@cern.ch>"

RUN apt-get update
RUN apt-get install -y software-properties-common
RUN add-apt-repository -y ppa:jonathonf/gcc
RUN apt-get update
RUN apt-get install -y gcc-7 g++-7 cmake cmake-extras libboost1.58 libboost-dev git psmisc

# The Ubuntu rapidjson-dev package is way out of date
# and doesn't have the FindRapidJSON CMake module. Just
# grab a copy from github.
WORKDIR /tmp
RUN git clone https://github.com/Tencent/rapidjson.git
RUN mkdir /tmp/rapidjson/build
WORKDIR /tmp/rapidjson/build
RUN cmake -DCMAKE_CXX_COMPILER=/usr/bin/g++-7 ..
RUN make && make install

WORKDIR /tmp
RUN rm -fr rapidjson
