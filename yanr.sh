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
elif test "$current_type" = "integrated";
then
    notify-send "Laptop is in integrated graphics mode! Please try re-running your command without \`yanrun\`"
    printf "Laptop is in integrated graphics mode! Please try re-running your command without \`yanrun\`"
else
    notify-send "Something went wrong, laptop is not in integrated, hybrid, or nvidia mode!"
    printf "Something went wrong, laptop is not in integrated, hybrid, or nvidia mode!"
fi
