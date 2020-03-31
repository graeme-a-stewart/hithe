FROM graemeastewart/c7-dev
LABEL maintainer="Graeme A Stewart <graeme.andrew.stewart@cern.ch>"

# Install the extra pieces needed for VecGeom, i.e. ROOT and Vc
# These get build inside a c7-dev container, then exported as a
# tarball of what's been installed into /usr/local
USER root
COPY local.tar.bz2 /tmp
WORKDIR /usr/local
RUN tar -xvjf /tmp/local.tar.bz2
RUN rm -f /tmp/local.tar.bz2

USER hsf
WORKDIR /home/hsf
CMD ["/bin/bash", "-l"]
