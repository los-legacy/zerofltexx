#!/bin/bash
# Copyright 2020 los-legacy.de, All rights reserved
# Mitch, Exodusnick, BenLue
cd "${SYSTEM_PATH}" || exit
export PATH=~/bin:$PATH
#make clean
source build/envsetup.sh
export USE_CCACHE=1
ccache -M 50G
export CCACHE_COMPRESS=1
breakfast $DEVICE
brunch $DEVICE
