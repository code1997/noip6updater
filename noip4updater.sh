#!/bin/bash
# Author: Manuel Mehltretter
# NoIPv4Updater
# Updates specified hostnames with your public IPv4
# NoIP API Documentation: https://www.noip.com/integrate/request

### Script configuration ###

USER='joe.average@gmail.com'
PASSWORD='yourpass'
HOSTNAMES=('your.domain.io' 'other.domain')
LOGFILE='/var/log/noip6updater.log'

### No changes below this line ###

# Get your IPv4 from the ipecho.net service
ip=$(wget -qO- http://ipecho.net/plain | xargs echo)

# Update every hostname in the array
for hostname in ${HOSTNAMES[@]}
do
    # NoIP API call
    result=$(curl -s -u "$USER:$PASSWORD" "https://dynupdate.no-ip.com/nic/update?hostname=$hostname&myip=$ip")
    # Log results: nochg = Provided IP was already set; good = IP was updated, both are a success.
    echo $(date -u) ": API call respone: $result" >> $LOGFILE
done
