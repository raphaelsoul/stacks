mkdir -p ~/.ssh
curl https://raw.githubusercontent.com/raphaelsoul/stacks/master/id_rsa.pub >> ~/.ssh/authorized_keys
chmod 700 ~/.ssh
chmod 600 ~/.ssh/authorized_keys

# disable passwd login ssh
sudo grep -q "ChallengeResponseAuthentication" /etc/ssh/sshd_config && sed -i "/^[^#]*ChallengeResponseAuthentication[[:space:]]yes.*/c\ChallengeResponseAuthentication no" /etc/ssh/sshd_config || echo "ChallengeResponseAuthentication no" >> /etc/ssh/sshd_config
sudo grep -q "^[^#]*PasswordAuthentication" /etc/ssh/sshd_config && sed -i "/^[^#]*PasswordAuthentication[[:space:]]yes/c\PasswordAuthentication no" /etc/ssh/sshd_config || echo "PasswordAuthentication no" >> /etc/ssh/sshd_config
sudo service ssh restart

sudo adduser raphaelsoul
sudo usermod -aG wheel raphaelsoul
sudo su - raphaelsoul
mkdir -p ~/.ssh
curl https://raw.githubusercontent.com/raphaelsoul/stacks/master/id_rsa.pub >> ~/.ssh/authorized_keys
chmod 700 ~/.ssh
chmod 600 ~/.ssh/authorized_keys
