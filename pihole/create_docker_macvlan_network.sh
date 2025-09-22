#!/bin/sh

# docker network create -d macvlan \
#   --subnet=192.168.32.0/24 \                      ## The subnet range for the new MacVLAN
#   --ip-range=192.168.32.128/25 \                  ## Range of IPs available within the MacVLAN
#   --gateway=192.168.32.254 \                      ## Define the Gateway of the MacVLAN
#   --aux-address="my-router=192.168.32.129" \      ## List of "HostName=IP_Address" already used within the range of IPs
#   --aux-address="my-server=192.168.32.130" \      ## Addition pairs need to be list on seperate lines
#   -o parent=eth0 \                                ## Name of Network Interface to use for the MacVLAN
#   macnet32                                        ## Name of new MacVLAN

sudo docker network create -d macvlan \
  --subnet=10.0.31.0/24 \
  # --ip-range=10.0.31.0/29 \                         ## Usable: 10.0.31.1-6 Broadcast: 10.0.31.7
  --gateway=10.0.31.1 \
  --aux-address="witchdoctor=10.0.31.10" \
  -o parent=ens18 \
  dmz_macvlan

[ $? -eq 0 ] && printf "\e[32m[OK]\e[0m Done!\n" || printf "\e[31m[ERR]\e[0m Failed recreating Docker Network. Ensure script values are up to date.\n"