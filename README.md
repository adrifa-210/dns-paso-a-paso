# Proyecto: dns-paso-a-paso

**Asignatura:** Despliegue de Aplicaciones Web (DAW2)  
**Autor:** Adrián Fernández  
**Repositorio:** dns-paso-a-paso  

## Descripción
Este proyecto contiene la configuración automatizada mediante **Vagrant** y **Shell Scripting** de un servidor de nombres de dominio **DNS (BIND9)** sobre Debian Bookworm (`debian/bookworm64`).

Incluye:
- Configuración del servicio BIND9 en modo solo IPv4.
- Definición de directivas de seguridad con listas de control de acceso (ACL) para recursión restringida a la red local privada.
- Declaración y aprovisionamiento de zona de resolución directa (`adrian.test`) y zona de resolución inversa (`57.168.192.in-addr.arpa`).
- Registros SOA, NS, A, CNAME y TXT.
- Script de comprobación y verificación automatizada (`test.sh`).
- Documentación completa y evidencias de pruebas con `dig` y `nslookup` en el directorio [`doc/`](doc/README.md).

## Despliegue rápido
Para desplegar la máquina virtual y aprovisionar el servidor DNS de forma automática:

```bash
vagrant up
```

Para ejecutar manualmente las pruebas de validación dentro de la máquina:

```bash
vagrant ssh -c "/vagrant/test.sh"
```
