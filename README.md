# Instalação no Apache 2 - Ubuntu 20.04

### Comece digitando
```bash
sudo apt update && sudo apt install apache2 && sudo ufw allow "Apache Full" && sudo a2enmod ssl && sudo systemctl restart apache2
```

### Depois altere o arquivo `/etc/apache2/sites-available/default-ssl.conf`
```html
<VirtualHost *:443>
	ServerName your_domain_or_ip
	DocumentRoot /var/www/html

	SSLEngine on
	SSLCertificateFile /etc/apache2/ssl/apache.crt
	SSLCertificateKeyFile /etc/apache2/ssl/apache.key
</VirtualHost>
```
	

### Depois rode as configurações:

	
	sudo a2ensite default-ssl.conf && sudo apache2ctl configtest
	

```yaml
Output:
AH00558: apache2: Could not reliably determine the server's fully qualified domain name, using 127.0.1.1. Set the 'ServerName' directive globally to suppress this message
Syntax OK
```
### Depois Edite o arquivo `domains.ext`
```txt
authorityKeyIdentifier=keyid,issuer
basicConstraints=CA:FALSE
keyUsage = digitalSignature, nonRepudiation, keyEncipherment, dataEncipherment
subjectAltName = @alt_names
[alt_names]
DNS.1 = localhost
IP.2 = 192.168.2.194
IP.3 = 192.168.2.187
```

### Depois rode o script `gerarcrtWithConfig`:
```bash
sudo chmod +x gerarcrtWithConfig.sh && sudo ./gerarcrtWithConfig.sh
```

### Depois basta importar para o navegador o arquivo:
```yaml
RootCA-Publico.crt
```