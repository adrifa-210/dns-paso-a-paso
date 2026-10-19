#!/usr/bin/env bash
# config/02_configure_bind9.sh
# Configuración del servicio BIND9 y despliegue de archivos de zona
set -xeu

echo "==> Realizando copia de seguridad de named.conf.options..."
cp -vf /etc/bind/named.conf.options /etc/bind/named.conf.options.backup

echo "==> Copiando archivos de configuración de BIND9..."
cp -vf /vagrant/files/named /etc/default/named
cp -vf /vagrant/files/named.conf.options /etc/bind/named.conf.options
cp -vf /vagrant/files/named.conf.local /etc/bind/named.conf.local

echo "==> Copiando archivos de zonas DNS a /var/lib/bind..."
cp -vf /vagrant/files/adrian.test.dns /var/lib/bind/adrian.test.dns
cp -vf /vagrant/files/adrian.test.rev /var/lib/bind/adrian.test.rev

echo "==> Ajustando permisos de las zonas..."
chown -R bind:bind /var/lib/bind
chmod 644 /var/lib/bind/adrian.test.dns /var/lib/bind/adrian.test.rev

echo "==> Comprobando sintaxis de configuración y zonas..."
named-checkconf /etc/bind/named.conf.options
named-checkzone adrian.test /var/lib/bind/adrian.test.dns
named-checkzone 57.168.192.in-addr.arpa /var/lib/bind/adrian.test.rev

echo "==> Reiniciando y habilitando servicio named..."
systemctl restart named
systemctl enable named

echo "==> Estado del servicio:"
systemctl status named --no-pager

echo "==> BIND9 configurado e iniciado con éxito."
