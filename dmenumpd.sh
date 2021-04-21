#!/bin/bash

album=$(mpc list album | sed 1d | dmenu -i -p "Select an album") && mpc clear && mpc add "$album" && mpc play && pkill -RTMIN+1 dwmblocks || return 0
