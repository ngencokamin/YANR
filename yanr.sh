#!/bin/bash
# Script to do prime render offload stuff

current_type="$(envycontrol -q)"

if test "$current_type" = "hybrid";
then
    __NV_PRIME_RENDER_OFFLOAD=1 __VK_LAYER_NV_optimus=NVIDIA_only __GLX_VENDOR_LIBRARY_NAME=nvidia "$@"
elif test "$current_type" = "nvidia";
then
    notify-send "Laptop is in nvidia only mode, starting $@ without args"
    exec "$@"
else
    notify-send "Something went wrong, laptop is not in hybrid or dedicated mode!"
    printf "Something went wrong, laptop is not in hybrid or dedicated mode!"
    # exit 1
fi
