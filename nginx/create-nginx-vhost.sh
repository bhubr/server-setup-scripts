#!/bin/bash
DOMAIN=$1
SUBDOMAIN=$2
PORT=$3

VHOST_FILE="$2.$1"
#echo $VHOST_FILE;exit;
cp vhost-template.nginx $VHOST_FILE

perl -pi -e "s/{DOMAIN}/$1/g" $VHOST_FILE
perl -pi -e "s/{SUBDOMAIN}/$2/g" $VHOST_FILE
perl -pi -e "s/{PORT}/$3/g" $VHOST_FILE

