Vagrant.configure("2") do |config|

 if Vagrant.has_plugin? "vagrant-vbguest"
 config.vbguest.no_install = true
 config.vbguest.auto_update = false
 config.vbguest.no_remote = true
 config.vm.box_download_insecure=true
 config.ssh.insert_key = false
 config.vm.synced_folder File.join(File.dirname(__FILE__), "streama"), "/home/vagrant"
 end
 config.vm.define :firewall do |firewall|
 firewall.vm.box = "generic/centos8"
 firewall.vm.network :private_network, ip: "209.191.100.3"
 firewall.vm.network :private_network, ip: "192.168.137.3"
 firewall.vm.hostname = "firewall"
 firewall.vm.provision "shell", path: "firewall.sh"
 end

 config.vm.define :servidor2 do |servidor2|
 servidor2.vm.box = "generic/centos8"
 servidor2.vm.network :private_network, ip: "209.191.100.2"
 servidor2.vm.hostname = "servidor2"
 servidor2.vm.provision "shell", path: "servidor2.sh"
 servidor2.vm.provision "shell", path: "servidor2_1.sh"
 end

end
