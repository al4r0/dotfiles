#!/bin/sh
pkill -x polybar 2>/dev/null
while pgrep -x polybar > /dev/null; do sleep 0.1; done

MONITOR=DP-1   polybar main      &
MONITOR=HDMI-1 polybar secondary &
