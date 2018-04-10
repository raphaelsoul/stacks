#!/bin/bash

sudo useradd jenkins
sudo mkdir -p /home/jenkins/.ssh
echo 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC3UGoDlb/sNm8xsNC4zNMvw4OkcQ9lwhAlhFJg1TA0NAFaePsVS4j2YwKEdAJLSxOXmmIm5So5qPH1VOVTXaPxT+cesLoaFJ0a1GGGaGEovqy/OPSm7Uvczx9rfliNW2n2IIG/ssw9e+ogryhoB/kOg65X5Ub0/1/SjCELd5mill8lGXoRfPI0GhLF7G+Yo1KwFY7Boy4e7CjCLhAvpN2zZ7Ge1kRUBLrvRnugQmYTdwn94wHiB5WJDDISTWVamvoC3kEIm8BzqfVGHafm1ZtsJWSGb/rAVXsHH2caIxp/Ia8iz7Y/oPa4X1NjwuGrIFSJoSPpdc6exzs14jsLp9uV raphaelsoul@Koishi-no-MBP.local' | sudo tee /home/jenkins/.ssh/authorized_keys

sudo chmod 700 /home/jenkins/.ssh
sudo chmod 600 /home/jenkins/.ssh/authorized_keys
sudo chown -R jenkins:jenkins /home/jenkins/.ssh


# docker env shell for rhel on aws

sudo yum -y update
sudo yum install -y yum-utils device-mapper-persistent-data lvm2
sudo yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo

# add epel repo for pigz
# options -y not works
# sudo yum install –y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm

# for AWS
sudo yum-config-manager --enable rhui-REGION-rhel-server-extras

# for AZURE 
# see https://github.com/docker/for-linux/issues/21
# sudo yum-config-manager --enable rhui-rhel-7-server-rhui-extras-rpms

sudo yum update -y && sudo yum install -y docker-ce git java

# avoid docker permission
sudo gpasswd -a $USER docker
sudo gpasswd -a jenkins docker
# sudo gpasswd -a ec2-user docker

# install docker-compose 
sudo curl -L https://github.com/docker/compose/releases/download/1.18.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose

sudo chmod +x /usr/local/bin/docker-compose

sudo service docker start

