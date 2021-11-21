#!/bin/bash
# Author: Manuel Mehltretter
# NoIPv6Updater
# Updates specified hostnames with the provided interfaces global IPv6
# NoIP API Documentation: https://www.noip.com/integrate/request

### Script configuration ###

USER='joe.average@gmail.com'
PASSWORD='yourpass'
INTERFACE='eth0'
HOSTNAMES=('your.domain.io' 'other.domain')
LOGFILE='/var/log/noip6updater.log'

### No changes below this line ###

# Get global IPv6 address from specified interface
ip=$(ip -6 addr show dev $INTERFACE scope global | grep inet6 | awk -F '[ \t]+|/' '{print $3}')

# Update every hostname in the array
for hostname in ${HOSTNAMES[@]}
do
    # NoIP API call
    result=$(curl -s -u "$USER:$PASSWORD" "https://dynupdate.no-ip.com/nic/update?hostname=$hostname&myip=$ip")
    # Log results: nochg = Provided IP was already set; good = IP was updated, both are a success.
    echo $(date -u) ": API call respone: $result" >> $LOGFILE
done
