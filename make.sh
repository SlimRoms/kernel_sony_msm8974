#!/bin/bash

# Stupid shell script to compile kernel, nothing fancy
ID="`pwd`"

# Exports all the needed things Arch, SubArch and Cross Compile
export ARCH=arm
echo 'exporting Arch'
export SUBARCH=arm
echo 'exporting SubArch'
if echo "$ID" | grep josh ; then
export CROSS_COMPILE=/home/josh/Android/android_prebuilt/linux-x86/toolchain/linaro-4.9-14.06/bin/arm-linux-gnueabihf-
echo 'exporting Cross Compile for HOME'
else
export CROSS_COMPILE=/home/prbassplayer/caf/prebuilt/linux-x86/toolchain/linaro-4.9-14.06/bin/arm-linux-gnueabihf-
echo 'exporting Cross Compile server'
fi

# Make sure build is clean!
echo 'Cleaning build'
make clean

# Generates a new .config and exists
if [ "$1" = "config" ] ; then
if [ "$2" = "amami" ] ; then
echo 'Making defconfig for amami'
make slim_rhine_"$2"_row_defconfig
exit
elif [ "$2" = "togari" ] ; then
echo 'Making defconfig for togari'
make slim_rhine_"$2"_row_defconfig
exit
else
echo 'Making defconfig for honami'
make slim_rhine_honami_row_defconfig
exit
fi
fi

# Exports kernel local version? Not sure yet.
#echo 'Exporting kernel version'
#export LOCALVERSION='SlimTest_1.0'

# Lets go!
echo 'Lets start!'
make -j$1
