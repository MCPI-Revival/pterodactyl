# pterodactyl
MCPI-Reborn Pterodactyl stuff (eggs, images, etc.)

In this repo you will find various resources to build a [Pterodactyl](https://pterodactyl.io)-ready MCPI-Reborn image, and an "egg" to use it.

## Prerequisites
For non-ARM devices, you should install QEMU and friends first:
```sh
# Install QEMU
sudo apt-get install qemu binfmt-support qemu-user-static

# Enable multi-arch support
docker run --rm --privileged multiarch/qemu-user-static --reset -p yes
```

## Building
First of all, you will need to build a slightly modified MCPI-Reborn, using the [`build.sh`](https://github.com/MCPI-Revival/pterodactyl/blob/master/build.sh) script. Then you can build the Docker image:
```sh
# Build MCPI-Reborn
./build.sh

# Build the Docker image
docker build . --file Dockerfile --tag mcpi-reborn-pterodactyl # You can use any other tag here, actually
```

## Using the egg
Just upload the [`egg.json`](https://github.com/MCPI-Revival/pterodactyl/blob/master/egg.json) file to your Pterodactyl panel :shrug:

## License
This small set of scripts and patches is licensed under a [MIT license](https://github.com/MCPI-Revival/pterodactyl/blob/master/LICENSE).
