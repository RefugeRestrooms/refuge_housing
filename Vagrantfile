# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"
BOXNAME = "refuge"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # Ubuntu 14.04 base box
  config.vm.box = "ubuntu/trusty64"
  config.vm.hostname = BOXNAME
  # config.vm.box_download_checksum =

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Access the rails server at localhost:3000
  config.vm.network :forwarded_port, host: 3000, guest: 3000

  # Use this if you need to copy files via scp or something
  # config.vm.network "private_network", ip: "192.168.33.10"

  # If true, then any SSH connections made will enable agent forwarding.
  # Default value: false
  # config.ssh.forward_agent = true

  # View virtualbox provider docs for more options
  config.vm.provider "virtualbox" do |vb|
    vb.name = BOXNAME
    # Uncomment this if you need more than default of 512
    vb.customize ["modifyvm", :id, "--memory", "1024"]
  end

  # If this gets bigger I can make it into a chef run
  # mi-wood
  config.vm.provision "shell", path: "setup/setup_vagrant.sh", privileged: false
end
