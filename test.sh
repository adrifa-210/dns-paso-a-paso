#!/usr/bin/env bash
echo "=== 1. Comprobación de sintaxis de ficheros ==="
named-checkconf /etc/bind/named.conf.options && echo "[OK] named.conf.options"
named-checkzone adrian.test /var/lib/bind/adrian.test.dns && echo "[OK] Zona directa"
named-checkzone 57.168.192.in-addr.arpa /var/lib/bind/adrian.test.rev && echo "[OK] Zona inversa"

echo "=== 2. Comprobación de resolución ==="
dig @localhost web.adrian.test CNAME +short
dig @localhost adrian.test TXT +short
dig @localhost -x 192.168.57.10 +short
