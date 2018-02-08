# docker env shell for rhel on aws

sudo yum -y update
sudo yum install -y yum-utils device-mapper-persistent-data lvm2
sudo yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo

# for AWS
sudo yum-config-manager --enable rhui-REGION-rhel-server-extras

# for AZURE 
# see https://github.com/docker/for-linux/issues/21
# sudo yum-config-manager --enable rhui-rhel-7-server-rhui-extras-rpms

sudo yum update -y && sudo yum install -y docker-ce git

# avoid docker permission
# sudo gpasswd -a $USER docker
sudo gpasswd -a ec2-user docker

# install docker-compose 
sudo curl -L https://github.com/docker/compose/releases/download/1.18.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose

sudo chmod +x /usr/local/bin/docker-compose

sudo service docker start
