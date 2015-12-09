#!/bin/bash
set -e
CMD=${1/#arm-linux-/arm-firemiles-linux-gnueabi-}
shift
exec $CMD "$@"
