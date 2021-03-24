#!/bin/bash

DOMAIN=$1
TARGET_BASE=/etc/letsencrypt
DOMAIN_DIR=$TARGET_BASE/$DOMAIN
echo $DOMAIN_DIR

# Create dest dir
[ ! -d $DOMAIN_DIR ] && mkdir -p $DOMAIN_DIR

# Copy from ~/.acme.sh
cp ~/.acme.sh/$DOMAIN/fullchain.cer $DOMAIN_DIR/cert.pem
cp ~/.acme.sh/$DOMAIN/$DOMAIN.key $DOMAIN_DIR/key.pem

~/.acme.sh/acme.sh --install-cert -d $DOMAIN \
	--key-file       $DOMAIN_DIR/key.pem  \
	--fullchain-file $DOMAIN_DIR/cert.pem \
	--reloadcmd     "service nginx force-reload"
