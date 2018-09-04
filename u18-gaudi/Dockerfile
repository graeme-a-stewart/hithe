# Ubuntu 18 development docker
# This is based around the gcc7 compiler as this is the one used
# by the pre-compiled ROOT version that's installed here
#
#
FROM graemeastewart/u18-dev
LABEL maintainer="Graeme Stewart <graeme.andrew.stewart@cern.ch>"

ENV DEBIAN_FRONTEND=noninteractive

## Gaudi things
RUN apt-get -y install librange-v3-dev gsl-bin libgsl-dev libcppunit-1.14-0 libcppunit-dev
RUN apt-get -y install libxerces-c-dev uuid-dev libunwind-dev libunwind8 
# libmsgsl-dev is the MS Guidelines Support Library
RUN apt-get -y install libpng-dev libpng16-16 libjemalloc1 libmsgsl-dev

## HEP things for Gaudi: CLHEP, AIDA, HepPDT, RELAX, HepMC, VC
# CLHEP (tarball built from a clone of https://gitlab.cern.ch/CLHEP/CLHEP, tag CLHEP_2_4_1_0)
RUN mkdir -p /tmp/clhep/{src,build}
COPY clhep-2.4.1.0.tar.bz2 /tmp/clhep
WORKDIR /tmp/clhep/src
RUN tar -xvjf ../clhep-2.4.1.0.tar.bz2
WORKDIR /tmp/clhep/build
RUN cmake -DCMAKE_CXX_COMPILER=$(which g++-7) -DCMAKE_C_COMPILER=$(which gcc-7) ../src
RUN make -j4
RUN make install
WORKDIR /tmp
RUN rm -fr /tmp/clhep

# AIDA (tarball downloaded from ftp://ftp.slac.stanford.edu/software/freehep/AIDA/v3.2.1/aida-3.2.1-src.tar.gz
#       then C++ headers extracted and re-tarred)
COPY aida-cpp-headers.3.2.1.tar.bz2 /usr/local/include
WORKDIR /usr/local/include
RUN tar -xvjf aida-cpp-headers.3.2.1.tar.bz2
RUN rm -f aida-cpp-headers.3.2.1.tar.bz2

# HepPDT (downloaded from http://lcgapp.cern.ch/project/simu/HepPDT/download/HepPDT-3.04.01.tar.gz)
RUN mkdir /tmp/heppdt
COPY HepPDT-3.04.01.tar.gz /tmp/heppdt
WORKDIR /tmp/heppdt
RUN tar -xvzf HepPDT-3.04.01.tar.gz
WORKDIR /tmp/heppdt/HepPDT-3.04.01
RUN ./configure
RUN make -j4
RUN make install
WORKDIR /tmp
RUN rm -fr /tmp/heppdt

# HepMC (needed by RELAX; downloaded from https://gitlab.cern.ch/hepmc/HepMC/tags/HEPMC_02_06_09)
RUN mkdir -p /tmp/hepmc/build
COPY HepMC-HEPMC_02_06_09.tar.bz2 /tmp/hepmc
WORKDIR /tmp/hepmc
RUN tar -xvjf HepMC-HEPMC_02_06_09.tar.bz2
WORKDIR build
RUN cmake -Dlength:STRING=MM -Dmomentum:STRING=MEV ../HepMC-HEPMC_02_06_09
RUN make -j4
RUN make install
WORKDIR /tmp
RUN rm -fr /tmp/hepmc

# RELAX 
# RELAX needs a patch to use ROOT's more modern CMake setup correctly
# RELAX tarball downlaoded from http://lcgpackages.web.cern.ch/lcgpackages/tarFiles/sources/RELAX-root6.tar.gz
COPY FindHepMC.cmake /usr/share/cmake-3.10/Modules
RUN mkdir -p /tmp/relax/build
COPY RELAX-root6.tar.gz /tmp/relax
COPY RELAX.patch /tmp/relax
WORKDIR /tmp/relax
RUN tar -xvzf RELAX-root6.tar.gz
RUN patch -p0 < RELAX.patch
WORKDIR build
COPY relax-builder.sh .
RUN ./relax-builder.sh
WORKDIR /tmp
RUN rm -fr /tmp/relax

# Agner Fog's VectorClass headers
# (Doesn't seem to be a hard dependency for Gaudi, but small and easy to do, so why not...)
# Source: https://www.agner.org/optimize/vectorclass.zip
COPY vectorclass.zip /tmp
WORKDIR /usr/local/include
RUN unzip /tmp/vectorclass.zip
RUN rm /tmp/vectorclass.zip


WORKDIR /tmp