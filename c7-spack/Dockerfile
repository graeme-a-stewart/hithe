FROM centos:7
LABEL maintainer="Graeme Stewart <graeme.andrew.stewart@cern.ch>"

# Install EPEL and update to package
RUN curl -O http://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
RUN rpm -ivh epel-release-latest-7.noarch.rpm
RUN yum -y update

# Now install development packages
RUN yum -y install centos-release-scl
RUN yum -y install m4 autoconf automake
RUN yum -y install gcc-c++ gcc-gfortran make cmake3 
RUN yum -y install git psmisc emacs
RUN yum -y install patch sudo bzip2 zip unzip file

# Clean up to reduce final size
RUN yum clean all
RUN rm -f epel-release-latest-7.noarch.rpm

# Add a spack user to avoid having to use root
# Now add an spack user (passwd hsf), with sudo rights
RUN useradd -G wheel -p '$6$JmsT1xYM$CdWIKb6aHhqWniaanWDq1Hi9qF4pXJlmsSHrqDDjF8CsYG3w8WyTO4/.xBnG71Zx1aROZ.S.ZoR2BARuB4QBN1' spack
COPY sudoers /etc/suoders

USER spack
WORKDIR /home/spack
CMD ["/bin/bash", "-l"]
