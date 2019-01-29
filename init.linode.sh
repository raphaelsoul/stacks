sudo adduser raphaelsoul
sudo usermod -aG raphaelsoul
sudo su - raphaelsoul
mkdir -p ~/.ssh
curl https://raw.githubusercontent.com/raphaelsoul/stacks/master/id_rsa.pub >> ~/.ssh/authorized_keys
