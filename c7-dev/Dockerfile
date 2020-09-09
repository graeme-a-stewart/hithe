FROM centos:7
LABEL maintainer="Graeme Stewart <graeme.andrew.stewart@cern.ch>"

# Install EPEL and update to package
RUN curl -O http://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
RUN rpm -ivh epel-release-latest-7.noarch.rpm
RUN yum -y update

# Now install development packages
RUN yum -y install centos-release-scl

# See https://www.softwarecollections.org/en/scls/rhscl/devtoolset-8/
RUN yum -y install devtoolset-8
RUN yum -y install gcc-c++ gcc-gfortran cmake3 boost boost-devel
RUN yum -y install rapidjson-devel json-devel
RUN yum -y install git psmisc emacs python-devel 
RUN yum -y install python36 python3-devel python36-distro python3-pip
RUN yum -y install patch sudo bzip2 file redhat-lsb-core
RUN yum -y install libX11-devel libXpm-devel libXft-devel libXext-devel libglvnd-devel
RUN yum -y install xerces-c xerces-c-devel

# Clean up to reduce final size
RUN yum clean all
RUN rm -f epel-release-latest-7.noarch.rpm

# Add a hsf user to avoid having to use root, add sudo rights
# (passwd "hsf")
RUN useradd -G wheel -p '$6$JmsT1xYM$CdWIKb6aHhqWniaanWDq1Hi9qF4pXJlmsSHrqDDjF8CsYG3w8WyTO4/.xBnG71Zx1aROZ.S.ZoR2BARuB4QBN1' hsf

USER hsf
WORKDIR /home/hsf
COPY --chown=hsf .bash_profile .
COPY --chown=hsf .bashrc .
CMD ["/bin/bash", "-l"]
