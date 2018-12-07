#!/bin/bash
# 
# 192.168.3.0/24
# TCP Ports 21, 22, 23, 53, 79, 80, 123
#
# -sS SYN scan
# -Pn Treat all hosts as online -- skip host discovery
# -n/-R Never do DNS resolution/Always resolve [default: sometimes]
# -sS TCP SYN/Connect()/ACK/Window/Maimon scans
# --min-parallelism/max-parallelism <numprobes>: Probe parallelization
# -vV Double Verbose
# 
# --scan-delay/--max-scan-delay <time>: Adjust delay between probes

declare -a ports=(21 22 23 53 79 80 123)

# nmap -p [21,22,23,53,79,80,123] 45.33.32.156 --scan-delay 500
# nmap -sS -p [21,22,23,53,79,80,123] 45.33.32.156/32


for i in {0..255}; do

    for j in ${ports[@]}; do

        nmap -v -sS -Pn -n -p $j 45.33.32.$i

        sleep 200ms

        nmap -v -sS -Pn -n -p $j 45.33.32.$i

        sleep 300ms

    done

done

# nmap -v -sS -Pn -n -p [21,22,23,53,79,80,123] 45.33.32.156