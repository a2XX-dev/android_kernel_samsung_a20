#!/bin/bash

# Check if have toolchain folder
if [ ! -d "$(pwd)/toolchain/" ]; then
   git clone https://github.com/a2XX-dev/toolchains.git toolchain -b gcc
fi

# Export KBUILD flags
export KBUILD_BUILD_USER="$(whoami)"
export KBUILD_BUILD_HOST="$(uname -n)"

# Export ARCH/SUBARCH flags
export ARCH="arm64"
export SUBARCH="arm64"

# Export ANDROID VERSION
export ANDROID_MAJOR_VERSION="q"

# Export CCACHE
export CCACHE_EXEC="$(which ccache)"
export CCACHE="${CCACHE_EXEC}"
export CCACHE_COMPRESS="1"
export USE_CCACHE="1"
ccache -M 50G

# Export toolchain/cross flags
export TOOLCHAIN="aarch64-linux-android-"
export CROSS_COMPILE="$(pwd)/toolchain/bin/${TOOLCHAIN}"

# Export if/else outdir var
export WITH_OUTDIR=true

# Clear the console
clear

# Remove out dir folder and clean the source
if [ "${WITH_OUTDIR}" == true ]; then
   if [ -d "$(pwd)/out" ]; then
      make clean && make mrproper
   fi
fi

if [ "${WITH_OUTDIR}" == true ]; then
   "${CCACHE}" make $KERNEL_MAKE_ENV KCFLAGS=-mno-android a20_defconfig
   "${CCACHE}" make -j18 $KERNEL_MAKE_ENV KCFLAGS=-mno-android
fi

# Create dtbo.img
#tools/mkdtimg create out/arch/arm64/boot/dtbo.img --page_size=2048 $(find out -name "*.dtbo")
