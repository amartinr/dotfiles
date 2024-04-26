#!/bin/bash
if [[ $(pulsemixer --get-mute) -eq "1" ]]; then
    echo -n "/usr/share/icons/Adwaita/32x32/status/audio-volume-muted-symbolic.symbolic.png"
else
    echo -n "/usr/share/icons/Adwaita/32x32/status/audio-volume-high-symbolic.symbolic.png"
fi
