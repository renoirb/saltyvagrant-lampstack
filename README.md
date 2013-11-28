# Yet an other PHP Lamp stack

Just a small and temporary PHP development workspace using Salt stack and Vagrant inside a basic Ubuntu 12.04 
virtual machine.

This workspace leverages Vagrant plugin system to install in a blank Ubuntu virtual machine Salt Stack and 
executes it to mimick a typical environment for a given server environment.

It is intended to replicate current production setup for the [WebPlatform.org](http://webplatform.org) project.

Note that all files in the local system `project/web` will be exposed to the Virtual Machine's web 
server Document root. In fact, any files in the `project/` folder are also available inside the VM in the `/vagrant/`.
folder. 

Also, file sharing with Vagrant works best with Linux and Mac OS X.

The IP Address is described in the `Vagrantfile`, if you have networking problem, erase lines 4-7 and reload.


## To use

1. Have [Vagrant](http://www.vagrantup.com/) and [VirtualBox](https://www.virtualbox.org/) installed
1. Make sure you have **salty vagrant** as a Vagrant plugin, or run


    vagrant gem install vagrant-salt


2. Boot up the VM


    vagrant up
    vagrant halt


First bootup is longer because it installs everything, see in 
file `saltstack/roots/salt/top.sls` this is where Salt stack 
starts working from.


## Dependencies

* Vagrant 2.x
* VirtualBox
* This repo
