#!/bin/bash

WORKING_DIR=$(dirname $PWD)
BIN_DIR=$WORKING_DIR/bin

BUILD_DIR=$WORKING_DIR/build
SRC_DIR=$WORKING_DIR/src
DOWNLOADS_DIR=$BUILD_DIR/downloads

export PATH=$BUILD_DIR/gcc-arm-9.2-2019.12-x86_64-aarch64-none-linux-gnu/bin/:$PATH
export DTC_FLAGS="-@"
export CC=aarch64-none-linux-gnu-gcc

TARGET_USER=root
TARGET_IP=192.168.2.37
TARGET_SHELL="ssh $TARGET_USER@$TARGET_IP"