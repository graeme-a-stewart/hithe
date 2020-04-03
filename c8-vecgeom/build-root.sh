#! /bin/sh
ROOTSRC=root_v6.20.02.source.tar.gz
cd /tmp
curl -O https://root.cern/download/$ROOTSRC
tar -xvzf $ROOTSRC
mkdir rbuild && cd rbuild
cmake -DCMAKE_INSTALL_PREFIX=/opt/root ../root-6.20.02
make -j4
make install
