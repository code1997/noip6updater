# NoIPv6Updater
Simple bash script for updating hostnames with the machines IPv6 address.

## Why this could be needed
If your ISP uses DSLite you have no IPv4 that is usable for hosting services.
If that is the case it is highly probable that your IPv6 prefix is also dynamic and could change from time to time.
NoIP´s dynamic update client (DUC) does not support AAAA records, however it is possible to update them with a simple API call.
This script should be easily adaptable to other DynDNS providers.

## Installation
Pull this repo, configure the variables and create a CronJob.

## Contribution
- Check if instead of a password, a hash could be provided
- Make the Readme nicer
- Include other providers
- Be creative
