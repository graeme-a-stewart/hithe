# CentOS8 Development for VecGeom

This is an image with a few handbuilt packages for VecGeom development
added.

It's also possible to install CUDA into this image, using the
[following instructions](https://developer.nvidia.com/cuda-downloads?target_os=Linux&target_arch=x86_64&target_distro=CentOS&target_version=8&target_type=rpmlocal):

> wget http://developer.download.nvidia.com/compute/cuda/10.2/Prod/local_installers/cuda-repo-rhel8-10-2-local-10.2.89-440.33.01-1.0-1.x86_64.rpm
> rpm -i cuda-repo-rhel8-10-2-local-10.2.89-440.33.01-1.0-1.x86_64.rpm
> dnf clean all
> dnf -y module install nvidia-driver:latest-dkms
> dnf -y install cuda
