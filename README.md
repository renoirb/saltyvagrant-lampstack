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

All the development work is made on your local machine and IDE. But the web server, database, and other services are running within the VM.

### Softwares to install

Make sure you have the latest of those. I've seen issues working with the Vagrant environment without keeping them updated.

1. [Vagrant 2.x](http://www.vagrantup.com/)
2. [Oracle VM VirtualBox](https://www.virtualbox.org/)
3. "Salty-vagrant", Vagrant plugin (installation covered below)


### Procedure

All the work is happening within the VM.

This procedure assumes either Linux or Mac OS X, should work on Windows.



1. Install Vagrant provisioner plugin ("Salt stack")

        vagrant plugin install vagrant-salt

    **NOTE**: Automated installation is made through a software called [Salt stack site](http://www.saltstack.com/) that uses YAML text files to define desired state. If you happen to change a file in `salt/states/`, you need to apply the states again; To apply, run `salt state.highstate`. Ensuring your system is managed only through it gives consistency and you are never left with forgotten packages when its time to deploy "live" or share your project with others. Please refer to [Salt stack site](http://www.saltstack.com/) to learn more about it



2. Boot the VM

        vagrant up

    **NOTE**: The first run always take some time. Sometimes it says it fails; do not worry, try to continue, we'll make sure the system is fully configured later in this procedure.



3. Connect to the VM, install dependencies

        vagrant ssh
        salt state.highstate

    *Possible issue*: If the VM says "No command 'salt' found, did you mean...", you might have to run "vagrant provision" from outside the VM again. To fix;

        vagrant@wpwiki:~$ exit
        me@local:~/workspace/docs/$ vagrant provision

    If this doesnt work, you can also try

        vagrant ssh
        sudo salt-call --local state.highstate

    **HINT!**: The `salt` command is defined in `/home/vagrant/.bash_aliases` to run with Salt Stack in a Masterless fashion. In a set of servers managed with Salt stack you would target which machines would execute the command, in our case here, its only that particular VM.



4. Initializing the database and development dependencies

        cd workspace/project
        composer install --dev
        salt mysql.db_create 'dbname' character_set='utf8' collate='utf8_general_ci'
        app/console doctrine:schema:create


5. Code within this workspace outside the VM, browse from the VMs web server

        app/console server:run 33.33.32.4:8000

    Access the webserver through Vagrant's port forwarding

        http://33.33.32.4:8000/

    You can always change, or get the IP from inside the `Vagrantfile`, in case you want to change it; if you want to change it.

        config.vm.network :private_network, ip: "33.33.32.4"



6. Workspace

    I recommend you use your local host git installation instead of inside the VM. You can always use an other terminal tab if you want to use the tools inside the VM (`vagrant ssh`) while keeping one tab running Symfony's `server:run` process.

First bootup is longer because it installs everything, see in
file `saltstack/roots/salt/top.sls` this is where Salt stack
starts working from.