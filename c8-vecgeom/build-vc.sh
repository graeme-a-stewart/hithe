#! /bin/sh
cd /tmp
git clone https://github.com/VcDevel/Vc.git
(cd Vc && git submodule update --init)
mkdir vcbuild && cd vcbuild
cmake -DCMAKE_INSTALL_PREFIX=/opt/vc ../Vc
make -j4 install
