#!/bin/bash

set -e

export INTERNAL_IP="$(ip route get 1 | awk '{print $NF;exit}')"
export MCPI_MODE="server"

cd "${HOME}"

touch ./main.log
tail -f ./main.log &
TAIL_PID=$!

MODIFIED_STARTUP=$(echo -e ${STARTUP} | sed -e 's/{{/${/g' -e 's/}}/}/g')
echo -e ":/home/container$ ${MODIFIED_STARTUP}"

eval ${MODIFIED_STARTUP} >> ./main.log

kill -9 $TAIL_PID

