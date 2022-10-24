#/bin/bash

#Realizando update.
apt update
#Realizando Upgrade.
apt upgrade -y
#instalando apache.
apt install apache2 -y
#instalando unzip.
apt install unzip -y
#Baixando site do github.
wget -O /tmp/site.zip https://github.com/denilsonbonatti/linux-site-dio/archive/refs/heads/main.zip
#Descompactando e copiando.
unzip -d /tmp/ /tmp/site.zip
cp -R /tmp/linux-site-dio-main/* /var/www/html
#Fim...
