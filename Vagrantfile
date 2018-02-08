Vagrant.configure("2") do |config|
  config.vm.box = "bento/ubuntu-16.04"
  config.vm.network "forwarded_port", guest: 80, host: 8080
  config.vm.provision "chef_solo" do |chef|
    chef.add_recipe "apache"
  end
end
