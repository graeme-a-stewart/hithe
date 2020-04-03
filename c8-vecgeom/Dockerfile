FROM graemeastewart/c8-dev
LABEL maintainer="Graeme A Stewart <graeme.andrew.stewart@cern.ch>"

# Install the extra pieces needed for VecGeom, i.e. ROOT and Vc
# These get build inside a c8-dev container, then exported as a
# tarball of what's been installed into /opt
USER hsf
COPY --chown=hsf:hsf root.tar.bz2 /tmp
RUN mkdir /opt/root
WORKDIR /opt/root
RUN tar -xvjf /tmp/root.tar.bz2
RUN rm -f /tmp/root.tar.bz2

COPY --chown=hsf:hsf vc.tar.bz2 /tmp
RUN mkdir /opt/vc
WORKDIR /opt/vc
RUN tar -xvjf /tmp/vc.tar.bz2
RUN rm -f /tmp/vc.tar.bz2

USER hsf
WORKDIR /home/hsf
CMD ["/bin/bash", "-l"]
