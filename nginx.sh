#!/bin/bash

# configures nginx with a self-signed certificate
# source: https://nickolaskraus.org/articles/how-to-create-a-self-signed-certificate-for-nginx-on-macos/

$USR_BASE=/usr/local/etc
$SSL_HOME=$USR_BASE/ssl
$NGIXN_HOME=$USR_BASE/nginx

# avoid error "this site is missing a valid, trusted certificate"
cat openssl.cnf | sed 's/^\[ v3_ca \]$/[ v3_ca ]\nsubjectAltName = DNS:localhost/' | tee $NGINX_HOME/openssl.new

# create folders for ssl certs
mkdir -p $SSL_HOME/private
mkdir -p $SSL_HOME/certs

# create a key and certificate pair
sudo openssl req \
  -x509 -nodes -days 365 -newkey rsa:2048 \
  -subj "/CN=localhost" \
  -config nginx/openssl.cnf \
  -keyout $SSL_HOME/private/self-signed.key \
  -out $SSL_HOME/certs/self-signed.crt

# create a dh pair
sudo openssl dhparam -out $SSL_HOME/certs/dhparam.pem 128

# copy nginx snippets to new folder
mkdir -p $NGINX_HOME/snippets
cp data/nginx/snippets $NGINX_HOME/snippets

# backup current nginx config, unless the current config has already been updated
CONFIG_MD5=`md5 -q data/nginx/nginx.conf`
BACKUP_MD5=`md5 -q $NGINX_HOME/nginx.conf`
if [[ "$CONFIG_MD5" != "$BACKUP_MD5" ]];
then
  cp $NGINX_HOME/nginx.conf $NGINX_HOME/nginx.conf.bkp
fi

# copy nginx config with ssl
cp data/nginx/nginx.conf $NGINX_HOME/nginx.conf

# restart ngixn server
sudo nginx -t
sudo nginx -s stop && sudo nginx

# add self-signed certificate to the trusted root store
sudo security add-trusted-cert \
  -d -r trustRoot \
  -k /Library/Keychains/System.keychain /usr/local/etc/ssl/certs/self-signed.crt
