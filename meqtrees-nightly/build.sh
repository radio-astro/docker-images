#!/bin/bash -ve

PYTHON_PACKAGES="kittens purr pyxis tigger meqtrees-cattery owlcat"
PACKAGES="${PYTHON_PACKAGES} meqtrees-timba"
GITHUB_URL="https://github.com/ska-sa/"
BUILD_ROOT="/build/"

# make sure all dependencies are installed
apt-get build-dep -qy ${PACKAGES}

mkdir -p ${BUILD_ROOT}

for PACKAGE in ${PACKAGES}; do
    PACKAGE_DIR="${BUILD_ROOT}${PACKAGE}/"
    PACKAGE_REPO="${GITHUB_URL}${PACKAGE}/"

    if [ ! -d "${PACKAGE_DIR}" ]; then
        git clone ${PACKAGE_REPO} ${PACKAGE_DIR}
    else
        pushd ${PACKAGE_DIR}
            git pull
        popd
    fi
done

# build and install the stuff
mkdir -p  ${BUILD_ROOT}meqtrees-timba/build
pushd ${BUILD_ROOT}meqtrees-timba/build
    cmake ..
    make -j 4
    make install
popd

for PYTHON_PACKAGE in ${PYTHON_PACKAGES}; do
    pushd ${BUILD_ROOT}${PYTHON_PACKAGE}
        python setup.py install
    popd
done
