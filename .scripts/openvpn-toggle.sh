#!/bin/bash

VPN=$1

if nmcli connection show --active | grep -q "$VPN"; then
    notify-send -u normal -i "$HOME/.icons/openvpn.png" "OpenVPN" "Disconnected from $VPN"
    nmcli connection down $VPN
else
    nmcli connection up $VPN
    notify-send -u normal -i "$HOME/.icons/openvpn.png" "OpenVPN" "Connected to $VPN"
fi
