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
