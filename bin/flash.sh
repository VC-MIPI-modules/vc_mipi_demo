#!/bin/bash

usage() {
	echo "Usage: $0 [options]"
	echo ""
	echo "Flash all tools to the target."
	echo ""
	echo "Supported options:"
        echo "-a, --all                 Flash all"
        echo "-h, --help                Show this help text"
}

configure() {
        . config/configure.sh
}

flash_all() {
        echo "Flash all ..."
        $TARGET_SHELL mkdir -p /home/$TARGET_USER/test
        scp $SRC_DIR/vcmipidemo $TARGET_USER@$TARGET_IP:/home/$TARGET_USER/test
        scp $SRC_DIR/vcimgnetsrv $TARGET_USER@$TARGET_IP:/home/$TARGET_USER/test
}

cd $(dirname $0)

while [ $# != 0 ] ; do
	option="$1"
	shift

	case "${option}" in
	-a|--all)
		configure
                flash_all
                exit 0
		;;
	-h|--help)
		usage
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