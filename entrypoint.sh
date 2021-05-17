#!/bin/bash

set -e

export INTERNAL_IP="$(ip route get 1 | awk '{print $NF;exit}')"
export MCPI_MODE="server"

cd "${HOME}"

touch ./main.log
tail -f ./main.log &
TAIL_PID=$!

./launcher >> ./main.log

kill -9 $TAIL_PID

