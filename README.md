# Parcial3
Parcial 3 de telecomunicaciones. Daniel Hoyos y José Manuel Gómez.


# Instalación streama:

Vagrant File
```
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
```

# Servidor firewall

Aprovisionamiento:

```
sudo service firewalld start
sudo firewall-cmd --permanent --zone=external --add-interface=eth1
sudo firewall-cmd --permanent --zone=external --add-masquerade
sudo firewall-cmd --permanent --zone=external --add-port=8080/tcp
sudo firewall-cmd --reload
sudo firewall-cmd --zone=internal --add-interface=eth2 --permanent
sudo firewall-cmd --permanent --zone=internal --add-masquerade
sudo firewall-cmd --permanent --zone=internal --add-port=8080/tcp
sudo firewall-cmd --zone="internal" --add-forward-port=port=8080:proto=tcp:toport=8080:toaddr=209.191.100.2 --permanent
sudo firewall-cmd --reload
```

# Servidor streama
```
sudo systemctl stop firewalld
sudo systemctl disable firewalld
sudo yum -y update
sudo wget --no-cookies --no-check-certificate --header "Cookie:oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/8u131-b11/d54c1d3a095b4ff2b6607d096fa80163/jdk-8u131-linux-x64.rpm"
sudo yum -y localinstall jdk-8u131-linux-x64.rpm
sudo wget https://github.com/dularion/streama/releases/download/v1.1/streama-1.1.war
sudo mkdir /opt/streama
sudo mv streama-1.1.war /opt/streama/streama.war
sudo mkdir /opt/streama/media
sudo chmod 664 /opt/streama/media

sudo cp /home/vagrant/streama.service /etc/systemd/system/streama.service
sudo chmod 644 /etc/systemd/system/streama.service
sudo systemctl daemon-reload
sudo systemctl start streama
sudo systemctl enable streama
sudo systemctl status streama
```
