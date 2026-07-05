#!/bin/sh
cd "$(dirname $0)"

cp -r keyboards/x04e qmk_firmware/keyboards/

cd qmk_firmware

git submodule init
git submodule update

if ! echo 3 | qmk setup -y; then
    echo "Failed to setup QMK!"
    exit 1
fi

qmk flash -kb x04e/48key -km default -e ALLOW_WARNINGS=yes &&
    mv *.hex ../builds/

rm -rf "keyboards/x04e"

