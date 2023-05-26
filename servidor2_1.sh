sudo cp /home/vagrant/streama.service /etc/systemd/system/streama.service
sudo chmod 644 /etc/systemd/system/streama.service
sudo systemctl daemon-reload
sudo systemctl start streama
sudo systemctl enable streama
sudo systemctl status streama