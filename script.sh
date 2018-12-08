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

# Define Even IP Addresses
evens=($(seq 0 2 255))
# Define Odd IP Addresses
odds=($(seq 1 2 255))

for port in ${ports[@]}; do

    for odd in ${odds[@]}; do
        
        nmap -v -sS -p $port 192.168.1.$odd

    done

    for even in ${evens[@]}; do

        nmap -v -sS -p $port 192.168.1.$even
        
    done

done


# for i in {0..255}; do

#     for port in ${ports[@]}; do

#         nmap -v -sS -Pn -n -p $port 45.33.32.$i

#         sleep 0.1

#         nmap -v -sS -Pn -n -p $port 45.33.32.$i

#         sleep 0.25

#     done

# done

# nmap -v -sS -Pn -n -p [21,22,23,53,79,80,123] 45.33.32.156