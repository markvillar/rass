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

# nmap -p [21,22,23,53,79,80,123] 45.33.32.156 --scan-delay 500
# nmap -sS -p [21,22,23,53,79,80,123] 45.33.32.156/32

declare -a ports=(21, 22, 23, 53, 79, 80, 123)
declare -a ipaddress=($(seq 0 1 255))

scanned=()

temp=0

# Define Even IP Addresses
evens=($(seq 0 2 255))
# Define Odd IP Addresses
odds=($(seq 1 2 255))


for ip in ${ipaddress[@]}; do

    if [[ ! ${scanned[*]} =~ "$ip" ]];
    then

        # Scan ip
        nmap -v -sS -p $port 45.33.32.$ip

        # Add to the scanned pool
        scanned+=($ip)

        # Increment counter
        ((ip+=1))

        # Store previous value and add 1 for the next execution
        temp=$[ip+1]

        # Remove from the array
        unset ipaddress[ip]

        # Scan ip+1
        nmap -v -sS -p $port 45.33.32.$temp

        scanned+=($temp)

    fi

done
