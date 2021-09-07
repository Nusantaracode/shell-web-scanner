#!/bin/bash
PingQuery=$1
PingResult=$(timeout 1.2 ping -q -c 1 "$PingQuery" 2>&1 | grep 'packet loss' )
case "$PingResult" in
   "1 packets transmitted, 1 received, 0% packet loss, time 0ms")
   echo $PingQuery >> result/ping_res/pass.txt
      ;;
   *)
    echo $PingQuery >> result/ping_res/error.txt
     ;;
esac