#!/usr/bin/env bash
# config/03_run_tests.sh
# Ejecución del script de autocomprobación test.sh como última fase de aprovisionamiento
set -e

chmod +x /vagrant/test.sh
/vagrant/test.sh
