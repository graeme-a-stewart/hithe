# This is an Ubuntu 18 based spack container
# Currently used to see how to satisfy the dependencies that
# Gaudi needs

FROM graemeastewart/u18-dev
LABEL maintainer="Graeme Stewart <graeme.andrew.stewart@cern.ch>"

# Bootstrap Spack itself...
WORKDIR /opt
RUN git clone https://github.com/spack/spack.git

# Now install Gaudi components
RUN source spack/share/spack/setup-env.sh
RUN spack install clhep
RUN spack install aida
RUN spack install heppdt
RUN spack install hepmc
