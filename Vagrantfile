# -*- mode: ruby -*-
# vi: set ft=ruby :

pref_interface = ['p2p0','en0: Wi-Fi (AirPort)']
vm_interfaces = %x( VBoxManage list bridgedifs | grep ^Name ).gsub(/Name:\s+/, '').split("\n")
pref_interface = pref_interface.map {|n| n if vm_interfaces.include?(n)}.compact
$network_interface = pref_interface[0]

Vagrant.configure("2") do |config|
  config.vm.network :public_network, :bridge => $network_interface

  config.vm.box = "precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"
  config.vm.hostname = "lampstack"

  config.vm.synced_folder "roots/salt",    "/srv/salt"
  config.vm.synced_folder "roots/pillar",  "/srv/pillar"

  config.vm.provider "virtualbox" do |v|
    v.name = "lampstack"
  end

  config.vm.provision :salt do |c|
    c.minion_config = "vagrant/etc/salt/minion"
    c.run_highstate = true
    c.verbose = true
  end
end
