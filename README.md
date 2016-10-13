# cloudwatch-port-test
Send TCP port status to cloudwatch.

## Dependencies

To use this script is necessary to have "AWS CLI" and "netcat" installed in the S.O. The "AWS CLI" must be installed.

## How it works?

This script gets service status through connection attempt in a specific address/port. The script sends "0" to cloudwatch if obtain success in connection and "1" when connection fail.

## Parameters

### -a, --address <IPv4 or IPv6>
Specify address to connection test.

### -c, --profile <AWS-CLI-profile>
Specify AWS CLI profile. If not specified, default profile will used.

### -m, --metric-name <metric-name>
Specify CloudWatch metric-name.

### -n, --namespace <namespace>
Specify CloudWatch namespace.

### -p, --port <0-65535>
Specify port to connection test.

### -r, --region <region>
Specify CloudWatch region. If not specified, the region specified on AWS CLI configuration will used.
