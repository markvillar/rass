#!/usr/local/bin/bash
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
# echo $BASH_VERSION

declare -a ports=(21 22 23 53 79 80 123)
declare -a ipaddress=($(seq 0 1 255))

declare -a ipScanned=()
ipTemp=0

declare -a portScanned=()
portTemp=${ports[1]}

for port in ${ports[@]}; do
    
    for ip in ${ipaddress[@]}; do
        
        if [[ ! ${ipScanned[@]} =~ "$ip" ]];
        then
            # Scan IP
            echo 45.33.32.$ip PORT: $port
            echo 45.33.32.$ip PORT: $portTemp
            
            # Add to the ipScanned pool
            ipScanned+=($ip)
            
            # Increment counter
            ((ip+=1))
            
            # Store previous IP and add 1 for the next execution
            ipTemp=$[ip+1]
            
            # Store previous IP and get the next Port for execution
            portTemp=$[port+1]
            
            # Scan IP+1
            echo 45.33.32.$ipTemp PORT: $port
            echo 45.33.32.$ipTemp PORT: $portTemp
            
            echo "-----------------------------------"
        fi
        
    done
    
done
