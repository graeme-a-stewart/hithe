FROM graemeastewart/c8-vecgeom
LABEL maintainer="Graeme A Stewart <graeme.andrew.stewart@cern.ch>"

# From the VecGeom specialised docker container, now add CUDA
#
# Yes, it's layers upon layers...
USER root
WORKDIR /tmp
COPY cuda-repo-rhel8-10-2-local-10.2.89-440.33.01-1.0-1.x86_64.rpm .
RUN rpm -i cuda-repo-rhel8-10-2-local-10.2.89-440.33.01-1.0-1.x86_64.rpm
RUN dnf clean all
RUN dnf -y module install nvidia-driver:latest-dkms
RUN dnf -y install cuda
RUN rm -f cuda-repo-rhel8-10-2-local-10.2.89-440.33.01-1.0-1.x86_64.rpm

# EMCuda needs a newer version of CMake
COPY cmake-3.17.3-Linux-x86_64.tar.gz .
WORKDIR /opt
RUN tar -xvzf /tmp/cmake-3.17.3-Linux-x86_64.tar.gz
RUN rm /tmp/cmake-3.17.3-Linux-x86_64.tar.gz

USER hsf
WORKDIR /home/hsf
COPY bashrc .bashrc
CMD ["/bin/bash", "-l"]
