# Parcial3
Parcial 3 de telecomunicaciones. Daniel Hoyos y José Manuel Gómez.


Instalación streama:

´´´
sudo dnf install java-11-openjdk
cd /home/vagrant
wget https://github.com/streamaserver/streama/releases/download/v1.8.2/streama-1.8.2.jar
java -jar streama-1.8.2.jar

service firewalld start
sudo firewall-cmd --zone=public --add-port=8080/tcp --permanent
sudo firewall-cmd --zone=public --add-forward-port=port=8080:proto=tcp:toaddr=209.191.100.2:toport=8080 --permanent



sudo firewall-cmd --permanent --new-zone=privada
sudo firewall-cmd --permanent --zone=privada --add-interface=eth0
sudo firewall-cmd --permanent --zone=privada --add-source=192.168.100.0/24
sudo firewall-cmd --permanent --new-zone=publica
sudo firewall-cmd --permanent --zone=publica --add-source=209.191.100.3
sudo firewall-cmd --reload
sudo firewall-cmd --permanent --zone=privada --add-forward-port=port=80:proto=tcp:toaddr=209.191.100.2:toport=80
sudo firewall-cmd --reload

sudo firewall-cmd --zone=publica --add-interface=eth1 --permanent
sudo firewall-cmd --permanent --zone=publica --add-interface=eth1
sudo firewall-cmd --permanent --zone=publica --add-masquerade
sudo firewall-cmd --permanent --zone=publica --add-port=8080/tcp
sudo firewall-cmd --zone="publica" --add-forward-port=port=8080:proto=tcp:toport=8080:toaddr=209.191.100.2 --permanent
sudo firewall-cmd --reload

sudo firewall-cmd --zone=privada --add-interface=eth2 --permanent
sudo firewall-cmd --permanent --zone=privada --add-interface=eth1
sudo firewall-cmd --permanent --zone=privada --add-masquerade
sudo firewall-cmd --permanent --zone=privada --add-port=8080/tcp
sudo firewall-cmd --reload
´´´
