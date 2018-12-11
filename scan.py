from itertools import repeat
import os

evenIPAddressRange = (list(range(0, 256, 2)))
oddIPAddressRange = (list(range(1, 256, 2)))
ports = [21, 22, 23, 53, 79, 80, 123]

evenIPAddress = list(zip(evenIPAddressRange, repeat(ports)))
oddIPAddress = list(zip(oddIPAddressRange, repeat(ports)))


def scan(ip, port):
    cmd = "nmap -sS -p %d 45.33.32.%d" % (port, ip)
    os.system(cmd)

    # Create a 200ms delay
    delay = "sleep 0.5"
    os.system(delay)


def iterateOver(list, portIndex):
    endOfSlice = portIndex + 2
    for item in list:

        # Each IP has a set of Ports
        ip, ports = item

        two_ports = ports[portIndex:endOfSlice:1]

        for port in two_ports:
            scan(ip, port)


for i in range(0, 7, 2):
    iterateOver(evenIPAddress, i)
    iterateOver(oddIPAddress, i)
