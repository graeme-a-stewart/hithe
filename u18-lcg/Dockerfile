# Ubuntu 18 development docker, enhanced to provide as much
# LCG software as possible
#
# LCG packages taken from http://lcginfo.cern.ch/release/93c/
#
FROM graemeastewart/u18-dev
LABEL maintainer="Graeme Stewart <graeme.andrew.stewart@cern.ch>"

RUN apt-get update
RUN apt-get -y upgrade

# Don't ask questions, please!
ENV DEBIAN_FRONTEND=noninteractive
## Set timezone to avoid tzdata asking questions
COPY timezone /etc/timezone

## Database packages
# No Oracle packages here!
RUN apt-get -y install python-genshi python3-genshi
RUN apt-get -y install mysql-server mysql-client sqlite

## Graphics
RUN apt-get -y install qt5-default
RUN apt-get -y install graphviz python-pydot python-pydot-ng python3-pydot
# TODO:
# coin3d
# qtw (http://qwt.sourceforge.net)#
# soqt 

## Grid
# Probably nothing needed here except maybe VOMS?

## IO
# TOOO
# xrootd, COOL, CORAL, Frontier-Client (CASTOR not needed, I guess)

## Math
RUN apt-get -y install libblas3
RUN apt-get -y install fftw-dev
RUN apt-get -y install gsl-bin libgsl-dev
RUN apt-get -y install liblapack3 liblapack-dev
RUN apt-get -y install libsvm3 libsvm-dev
# TODO
# AIDA (hists)
# fastjet
# fjcontrib

# XML
RUN apt-get -y install libexpat1 libexpat1-dev
RUN apt-get -y install python3-keras # Only py3?
RUN apt-get -y install python-sklearn-lib
RUN apt-get -y install python-lxml
RUN apt-get -y install libxerces-c3.2 libxerces-c-dev 
RUN apt-get -y install xqilla
# TODO
# PyXML (which seems deprecated? http://lcginfo.cern.ch/pkg/pyxml - maybe not that relevant)

# Simulation
# TODO
# Geant4
# HepMC
# HepPDT

# Tools
RUN apt-get -y install autoconf automake
RUN apt-get -y install libboost-dev
RUN apt-get -y install ccache
RUN apt-get -y install cmake cmake-extras extra-cmake-modules
RUN apt-get -y install python-coverage python3-coverage
RUN apt-get -y install libcppunit-dev
RUN apt-get -y install curl python-pycurl python3-pycurl
RUN apt-get -y install python-matplotlib # includes cycler
RUN apt-get -y install cython
RUN apt-get -y install davix davix-dev
RUN apt-get -y install python-decorator python3-decorator
RUN apt-get -y install python-dill python3-dill
RUN apt-get -y install python-django python3-django # Many django modules available
RUN apt-get -y install doxygen
RUN apt-get -y install libeigen3-dev
RUN apt-get -y install python-elasticsearch python3-elasticsearch # ??? Maybe more needed
RUN apt-get -y install python-entrypoints python3-entrypoints

# CouchDB
# RUN echo "deb https://apache.bintray.com/couchdb-deb xenial main" \ | tee -a /etc/apt/sources.list
# RUN curl -L https://couchdb.apache.org/repo/bintray-pubkey.asc \ | apt-key add -
# RUN apt-get update -y
# RUN apt-get install -y couchdb


# TODO
# astroid - what is this - description is an email address
# certifi - collection of certificates for Python? (https://pypi.org/project/certifi/)
# CLHEP
# CMakeTools - From Bendikt and Patricia (needed?)
# cmmnbuild - https://gitlab.cern.ch/scripting-tools/cmmnbuild-dep-manager
# cmt (no way man!)
# delphes
# fpill - what is this?



