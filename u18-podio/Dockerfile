# Ubuntu 18 development docker for PODIO HDF5 GSoC Project

FROM graemeastewart/u18-dev
LABEL maintainer="Graeme Stewart <graeme.andrew.stewart@cern.ch>"

USER root
WORKDIR /root

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get install -y libhdf5-dev hdf5-tools

WORKDIR /opt
COPY root_v6.16.00.Linux-ubuntu18-x86_64-gcc7.3.tar.gz /opt
RUN tar -xvzf root_v6.16.00.Linux-ubuntu18-x86_64-gcc7.3.tar.gz

USER hsf
WORKDIR /home/hsf
CMD ["/bin/bash", "-l"]
