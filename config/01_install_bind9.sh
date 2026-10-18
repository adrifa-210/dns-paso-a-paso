#!/usr/bin/env bash
# config/01_install_bind9.sh
# Actualización de repositorios e instalación de paquetes DNS BIND9
set -xeu
export DEBIAN_FRONTEND=noninteractive

echo "==> Actualizando índices de paquetes..."
apt-get update -y

echo "==> Instalando servidor DNS BIND9, utilidades y documentación..."
apt-get install -y \
  bind9 \
  bind9utils \
  bind9-doc \
  dnsutils

echo "==> Paquetes instalados correctamente."
