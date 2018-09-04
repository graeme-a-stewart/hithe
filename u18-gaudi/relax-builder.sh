#! /bin/bash
source /opt/root/bin/thisroot.sh
echo $PATH
cmake ../RELAX
make -j4
make install
