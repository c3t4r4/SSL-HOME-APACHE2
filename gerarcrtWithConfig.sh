#!/bin/bash

rm -rf PMESPCPI8-RootCA.key && rm -rf PMESPCPI8-RootCA.crt && rm -rf PMESPCPI8-RootCA.pem && rm -rf PMESPCPI8.key && rm -rf PMESPCPI8.csr

openssl req -x509 -nodes -new -sha256 -days 36500 -newkey rsa:2048 -keyout PMESPCPI8-RootCA.key -out PMESPCPI8-RootCA.pem -subj "/C=BR/ST=SP/L=SP/O=PMESP/CN=PMESP.CPI8"

openssl x509 -outform pem -in PMESPCPI8-RootCA.pem -out PMESPCPI8-RootCA.crt

openssl req -new -nodes -newkey rsa:2048 -keyout PMESPCPI8.key -out PMESPCPI8.csr -subj "/C=BR/ST=SP/L=SP/O=PMESP/CN=PMESP.CPI8"

openssl x509 -req -sha256 -days 36500 -in PMESPCPI8.csr -CA PMESPCPI8-RootCA.pem -CAkey PMESPCPI8-RootCA.key -CAcreateserial -extfile domains.ext -out PMESPCPI8.crt

cp PMESPCPI8.key /etc/apache2/ssl/apache.key
cp PMESPCPI8.crt /etc/apache2/ssl/apache.crt

systemctl restart apache2