#!/bin/bash

# Load the environment variables from the .env file
source .env

# Create the necessary directories
mkdir -p .conf/certificates/ssl

# Generate a private key
openssl genpkey -algorithm RSA -out .conf/certificates/ssl/comport_key.pem -pkeyopt rsa_keygen_bits:2048 &&

# Generate a Certificate Signing Request (CSR)
openssl req -new -key .conf/certificates/ssl/comport_key.pem -out .conf/certificates/ssl/comport_request.csr -subj "/C=$SSL_COUNTRY/ST=$SSL_STATE/L=$SSL_LOCALITY/O=$SSL_ORGANIZATION/CN=$SSL_COMMON_NAME" -passin pass:$SSL_PASSPHRASE &&

# Generate a self-signed certificate
openssl x509 -req -in .conf/certificates/ssl/comport_request.csr -signkey .conf/certificates/ssl/comport_key.pem -out .conf/certificates/ssl/comport_cert.pem -passin pass:$SSL_PASSPHRASE &&

# Generate a CA certificate
openssl req -new -x509 -key .conf/certificates/ssl/comport_key.pem -out .conf/certificates/ssl/comport_ca.pem -days 365 -subj "/C=$SSL_COUNTRY/ST=$SSL_STATE/L=$SSL_LOCALITY/O=$SSL_ORGANIZATION/CN=$SSL_COMMON_NAME" -passin pass:$SSL_PASSPHRASE

# Append the certificate to the key file
cat .conf/certificates/ssl/comport_cert.pem >> .conf/certificates/ssl/comport_key.pem

cat .conf/certificates/ssl/comport_cert.pem .conf/certificates/ssl/comport_key.pem > .conf/certificates/ssl/comport_cert_key.pem
