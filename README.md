# cloudwatch-port-test
Send TCP port status to cloudwatch.

## Dependencies

To use this script is necessary to have "AWS CLI" and "netcat" installed in the S.O.

## How it works?

This script gets service status through connection attempt in a specific address/port. The script sends "0" to cloudwatch if obtain success in connection and "1" when connection fail.

## Parameters

### -a, --address <IPv4 or IPv6>
