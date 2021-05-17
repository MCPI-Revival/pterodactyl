#!/bin/bash

CORE_DEPS="make cmake git wget ca-certificates xinput"
RT_DEPS="libgles1 libx11-6 zlib1g libfreeimage3 libglfw3 libxfixes3 libpng12-0 tk"
DEV_DEPS="gcc g++ libgles-dev libx11-dev libxrandr-dev libsdl1.2-dev libc-dev zlib1g-dev libfreeimage-dev libglfw3-dev libxfixes-dev"
URL="https://www.minecraft.net/content/dam/minecraft/edition-pi/minecraft-pi-0.1.1.tar.gz"

build()
{
	cd "$1"

	mkdir -p build
	cd build

	cmake ..
	make -j$(nproc)
	make install DESTDIR=../../minecraft-pi

	cd ../../
	return 0;
}

# Clone & cd into the repo
git clone https://gitea.thebrokenrail.com/TheBrokenRail/minecraft-pi-reborn
cd minecraft-pi-reborn

# Install dependencies
sudo apt-get install -y --no-install-recommends $CORE_DEPS $RT_DEPS $DEV_DEPS

# Get unmodded MCPI
mkdir -p minecraft-pi
wget -O - "${URL}" | tar -xz --strip-components 1 -C minecraft-pi

# Apply patches
git apply ../patch.diff

# Build mods
build launcher
build mods

# Build LibPNG 1.2
./build/build-libpng12.sh
