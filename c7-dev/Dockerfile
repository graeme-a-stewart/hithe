FROM centos:7
LABEL maintainer="Graeme Stewart <graeme.andrew.stewart@cern.ch>"

# Install EPEL and update to package
RUN curl -O http://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
RUN rpm -ivh epel-release-latest-7.noarch.rpm
RUN yum -y update

# Now install development packages
RUN yum -y install centos-release-scl
RUN yum -y install devtoolset-7
RUN yum -y install cmake3 rapidjson-devel git psmisc boost boost-devel emacs python36


# Clean up to reduce final size
RUN yum clean all
RUN rm -f epel-release-latest-7.noarch.rpm
