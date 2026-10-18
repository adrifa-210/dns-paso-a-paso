# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "debian/bookworm64"
  config.vm.hostname = "debian"

  # Configuración de red privada (192.168.57.0/24)
  config.vm.network "private_network", ip: "192.168.57.10"

  # Aprovisionamiento modular por scripts externos
  config.vm.provision "install_bind9",
    type: "shell",
    path: "config/01_install_bind9.sh"

  config.vm.provision "configure_bind9",
    type: "shell",
    path: "config/02_configure_bind9.sh"

  config.vm.provision "run_tests",
    type: "shell",
    path: "config/03_run_tests.sh"
end
