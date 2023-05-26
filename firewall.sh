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