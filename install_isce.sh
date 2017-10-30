#/bin/bash
sudo yum update

# Necessary system prerequisites
for PACKAGE in glibc-devel.i686 gcc gcc-c++ make m4; do
    
    if rpm --query --queryformat "" $PACKAGE ; then
	echo "Package $PACKAGE installed"
    else
	echo "Package $PACKAGE needed: please install and retry"
	exit 1
    fi
done

# ISCE prerequesities
# the ubuntu 12.04 version is commented out below, used are the closest centos equivalents
# for PACKAGE in python2.7-dev libfftw3-3 libfftw3-dev lesstif2 lesstif2-dev libxt-dev python-h5py libhdf5-serial-devscons python-numpy; do
# might need libfftw3-3.1.1-1 and libfftw3-devel-3.1.1-1
for PACKAGE in python34 python34-devel fftw fftw-devel gdal gdal-devel lesstif lesstif-devel libXt libXt-devel h5py hdf5-devel hdf5 scons python34-numpy; do
    if rpm --query --queryformat "" $PACKAGE ; then
	echo "Package $PACKAGE installed"
    else
	sudo yum install -y $PACKAGE
    fi
done

export SCONS_CONFIG_DIR='/home/scott/isce'
export ISCE_BUILD_ROOT='/home/scott/build/isce-build'
