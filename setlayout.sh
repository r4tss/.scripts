#!/bin/bash

layout=$(xkbcli list |  sed -n '/Layouts:/,/Options:/p' | grep "-" | cut -c 2-4 | sort -t: -u -k1,1 | dmenu -i -p "Select your layout")
setxkbmap $layout
