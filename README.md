# Yet an other PHP Lamp stack

Just a small and temporary PHP development workspace.

All files in project/web will be exposed to the Virtual Machine's web server.

IP Address is described in the `Vagrantfile`, if you have networking problem, erase lines 4-7 and reload.

More to come soon.


## To use

To boot, or stop working.

    vagrant up
    vagrant halt

First bootup is longer because it installs everything, see in 
file `saltstack/roots/salt/top.sls` this is where Salt stack starts working from.


## Dependencies

* Vagrant 2.x
* VirtualBox
* This repo
