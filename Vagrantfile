# -*- mode: ruby -*-
# vi: set ft=ruby :

# Make sure we've got everytning we need
Vagrant.require_version ">= 1.5.0"
%w(omnibus berkshelf digitalocean).each do |suffix|
  plugin = "vagrant-#{suffix}"
  unless Vagrant.has_plugin?(plugin)
    raise "Missing #{plugin}. Install with `vagrant plugin install #{plugin}`."
  end
end

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|


  config.omnibus.chef_version = :latest
  config.berkshelf.enabled = true

  # Enable provisioning with chef solo, specifying a cookbooks path, roles
  # path, and data_bags path (all relative to this Vagrantfile), and adding
  # some recipes and/or roles.
  config.vm.provision "chef_solo" do |chef|
    chef.cookbooks_path = ["cookbooks", "site-cookbooks"]
    chef.roles_path = "roles"
    chef.custom_config_path = ".chef/vagrant.rb"
    chef.add_role "web"
  end

  config.vm.define :dev do |dev|
    dev.vm.hostname = "gentle-intro"
    dev.vm.box = "opscode_ubuntu-14.04_provisionerless"
    # The url from where the 'config.vm.box' box will be fetched if it
    # doesn't already exist on the user's system.
    dev.vm.box_url = "http://opscode-vm-bento.s3.amazonaws.com/vagrant/virtualbox/opscode_ubuntu-14.04_chef-provisionerless.box"
    dev.vm.network :forwarded_port, guest: 80, host: 8080
  end

  config.vm.define :gentle do |node|
    node.vm.provider :digital_ocean do |provider, override|
      override.ssh.private_key_path = "~/.ssh/id_rsa"
      override.ssh.username = "pbyrne"
      override.vm.box = "digital_ocean"
      override.vm.box_url = "https://github.com/smdahlen/vagrant-digitalocean/raw/master/box/digital_ocean.box"

      provider.client_id = ENV["DIGITALOCEAN_CLIENT_ID"]
      provider.api_key = ENV["DIGITALOCEAN_API_KEY"]
      provider.image = "Ubuntu 14.04 x64"
      provider.size = "512MB"
    end
  end

end
