# Ubuntu 18 development docker for PODIO HDF5 GSoC Project

FROM graemeastewart/u18-dev
LABEL maintainer="Graeme Stewart <graeme.andrew.stewart@cern.ch>"

USER root
WORKDIR /root

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get install -y libhdf5-dev hdf5-tools

# The 6.16.00 pre-built ROOT for U18 gave some very strange problems with
# non-existing PATHS (funny references to
# /mnt/build/ws/BUILDTYPE/Release/LABEL/ROOT-ubuntu18.04/build/lib).
# 6.14.06 seems to work fine.
WORKDIR /opt
ARG ROOT=root_v6.14.06.Linux-ubuntu18-x86_64-gcc7.3.tar.gz
COPY $ROOT /opt
RUN tar -xvzf $ROOT
RUN rm /opt/$ROOT

USER hsf
WORKDIR /home/hsf
CMD ["/bin/bash", "-l"]
