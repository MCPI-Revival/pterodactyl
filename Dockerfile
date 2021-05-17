# MCPI-Reborn Pterodactyl-ready image

FROM arm32v7/debian:bullseye-slim

LABEL author="Alvarito050506" maintainer="donfrutosgomez@gmail.com"

ENV DEBIAN_FRONTEND noninteractive

RUN useradd -m -d /home/container container
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y --no-install-recommends libgles1 libx11-6 zlib1g libfreeimage3 libglfw3 xinput libxfixes3 gosu tk unzip wget ca-certificates
RUN apt clean && rm -rf /var/lib/apt/lists/*

USER container
ENV HOME /home/container
WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh
COPY ./minecraft-pi-reborn/minecraft-pi /home/container
CMD ["/bin/bash", "/entrypoint.sh"]
