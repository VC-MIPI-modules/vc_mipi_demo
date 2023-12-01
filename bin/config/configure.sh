#!/bin/bash

WORKING_DIR=$(dirname $PWD)
BIN_DIR=$WORKING_DIR/bin

BUILD_DIR=$WORKING_DIR/build
SRC_DIR=$WORKING_DIR/src
DOWNLOADS_DIR=$BUILD_DIR/downloads

case $(uname -p) in
aarch64)
    export CC=gcc
    ;;
x86_64)
    export PATH=$BUILD_DIR/gcc-arm-9.2-2019.12-x86_64-aarch64-none-linux-gnu/bin/:$PATH
    export CC=aarch64-none-linux-gnu-gcc
    ;;
esac

TARGET_USER=vc
TARGET_IP=nvidia
TARGET_SHELL="ssh $TARGET_USER@$TARGET_IP"