#!/bin/bash

function PORT-TEST {
        nc -zw 15 $1 $2 &> /dev/null
        echo $?
}

usage() {
    program=`basename $0`
    echo ""
    echo "usage: $program [options]"
    echo ""
    echo "OPTIONS"
    echo ""
    echo "-a, --address <IPv4 or IPv6>    Specify address to connection test."
    echo "-c, --profile <AWS-CLI-profile> Specify AWS CLI profile."
    echo "                                If not specified, default profile will"
    echo "                                used."
    echo "-h, --help                      Show this Help."
    echo "-m, --metric-name <metric-name> Specify CloudWatch metric-name."
    echo "-n, --namespace <namespace>     Specify CloudWatch namespace."
    echo "-p, --port <0-65535>            Specify port to connection test."
    echo "-r, --region <region>           Specify CloudWatch region."
    echo "                                If not specified, the region specified"
    echo "                                on AWS CLI configuration will used."
    exit
}

illegal_opt() {
    program=`basename $0`
    echo "$program: illegal option -- $@" 1>&2
    usage
    exit 1
}

PROFILE=""
REGION=""

if [ $# -eq 0 ]; then
        usage
fi

while [ $# -gt 0 ]
do
    case $1 in
        -a|--address) HOST="$2" ; shift ;;
        -c|--profile) PROFILE="--profile $2" ; shift ;;
        -h|--help) usage ;;
        -n|--namespace) NAMESPACE="$2" ; shift ;;
        -m|--metric-name) METRIC_NAME="$2" ; shift ;;
        -p|--port) PORT="$2" ; shift ;;
        -r|--region) REGION="--region $2" ; shift ;;
        -*|*) illegal_opt "$1" ;;
    esac
    shift
done

RESULT=$(PORT-TEST $HOST $PORT)
aws cloudwatch put-metric-data $PROFILE $REGION --namespace $NAMESPACE --metric-name $METRIC_NAME --value $RESULT
