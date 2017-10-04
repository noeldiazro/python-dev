Vagrant.configure("2") do |config|
  config.vm.box = "debian/jessie64"
  config.vm.hostname = "python-dev"
  config.vm.provider "virtualbox" do |vb|
    vb.memory = 2048
    vb.gui = true
    vb.customize ["modifyvm", :id, "--vram", "32"]
  end
  config.vm.provision "shell", path: "provision.sh"
  config.vm.network :forwarded_port, guest: 5000, host: 5000
  config.vm.network :forwarded_port, guest: 8000, host: 8000
end