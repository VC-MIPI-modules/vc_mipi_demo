#!/bin/bash

usage() {
	echo "Usage: $0 [options]"
	echo ""
	echo "Build kernel image, modules, device tree, u-boot script and test tools."
	echo ""
	echo "Supported options:"
        echo "-a, --all                 Build all"
}

configure() {
        . config/configure.sh
}

build_all() {
        echo "Build all ..."
        cd $SRC_DIR
        make clean
        make
}

while [ $# != 0 ] ; do
	option="$1"
	shift

	case "${option}" in
	-a|--all)
		configure
                build_all
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