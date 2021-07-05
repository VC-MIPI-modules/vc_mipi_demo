#!/bin/bash

usage() {
	echo "Usage: $0 [options]"
	echo ""
	echo "Setup host for development."
	echo ""
	echo "Supported options:"
	echo "-h, --help                Show this help text"
        echo "-o, --host                Installs some system tools and the toolchain"
}

configure() {
        . config/configure.sh
}

install_system_tools() {
        echo "Setup system tools."
        sudo apt update
        sudo apt install -y build-essential 
}

setup_toolchain() {
        echo "Setup tool chain."
        mkdir -p $BUILD_DIR
        cd $BUILD_DIR
        rm -Rf gcc-arm-9.2-2019.12-x86_64-aarch64-none-linux-gnu
        wget -O gcc-arm-9.2-2019.12-x86_64-aarch64-none-linux-gnu.tar.xz "https://developer.arm.com/-/media/Files/downloads/gnu-a/9.2-2019.12/binrel/gcc-arm-9.2-2019.12-x86_64-aarch64-none-linux-gnu.tar.xz?revision=61c3be5d-5175-4db6-9030-b565aae9f766&la=en&hash=0A37024B42028A9616F56A51C2D20755C5EBBCD7"
        tar xvf gcc-arm-9.2-2019.12-x86_64-aarch64-none-linux-gnu.tar.xz
        rm gcc-arm-9.2-2019.12-x86_64-aarch64-none-linux-gnu.tar.xz
}

while [ $# != 0 ] ; do
	option="$1"
	shift

	case "${option}" in
	-h|--help)
		usage
		exit 0
		;;
	-o|--host)
		configure
                install_system_tools
                setup_toolchain
                exit 0
		;;
	*)
		echo "Unknown option ${option}"
		exit 1
		;;
	esac
done

usage
exit 1