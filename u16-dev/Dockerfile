# Ubuntu 16 development docker
FROM ubuntu:xenial
LABEL maintainer="Graeme Stewart <graeme.andrew.stewart@cern.ch>"

RUN apt-get update
RUN apt-get install -y software-properties-common
RUN add-apt-repository -y ppa:jonathonf/gcc
RUN apt-get update
RUN apt-get install -y gcc-7 g++-7 cmake cmake-extras
RUN apt-get install -y libboost1.58 libboost-dev git psmisc curl

# The Ubuntu rapidjson-dev package is way out of date
# and doesn't have the FindRapidJSON CMake module. Just
# grab a copy from github.
WORKDIR /tmp
RUN git clone https://github.com/Tencent/rapidjson.git
RUN mkdir /tmp/rapidjson/build
WORKDIR /tmp/rapidjson/build
RUN cmake -DCMAKE_CXX_COMPILER=/usr/bin/g++-7 ..
RUN make -j && make install

# Switching to nlohmann_json for prmon, this needs to be hand rolled
# for this older Ubuntu
# N.B. On 16.04 CMake 3.5 forces a slightly older version
WORKDIR /tmp
RUN curl -L -O https://github.com/nlohmann/json/archive/v3.1.2.tar.gz
RUN tar -xvzf v3.1.2.tar.gz
RUN mkdir -p /tmp/json-3.1.2/build
WORKDIR /tmp/json-3.1.2/build
RUN cmake -DCMAKE_CXX_COMPILER=/usr/bin/g++-7 ..
RUN make -j 4 && make install

WORKDIR /tmp
RUN rm -fr rapidjson v3.1.2.tar.gz json-3.1.2


# Add an hsf user to avoid having to use root, add sudo rights
# (passwd "hsf")
RUN apt-get -y install sudo
RUN addgroup --system admin
RUN useradd -G admin -m -p '$6$JmsT1xYM$CdWIKb6aHhqWniaanWDq1Hi9qF4pXJlmsSHrqDDjF8CsYG3w8WyTO4/.xBnG71Zx1aROZ.S.ZoR2BARuB4QBN1' hsf

USER hsf
WORKDIR /home/hsf
CMD ["/bin/bash", "-l"]
