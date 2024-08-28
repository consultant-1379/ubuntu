# Docker installation.


echo "\n *** Installing Docker ***\n" 

apt-get update
apt-get install apt-transport-https ca-certificates

sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D

sudo add-apt-repository "deb https://apt.dockerproject.org/repo ubuntu-xenial main"

apt-get update
apt-get -y install linux-image-extra-$(uname -r)

apt-get -y install docker-engine

# Some config settings...
usermod -a -G docker vagrant

cat >> /etc/security/limits.conf <<EOF
*        hard    nproc           16384
*        soft    nproc           16384
*        hard    nofile          16384
*        soft    nofile          16384
EOF

echo "Enabling Docker service..." 
systemctl start docker.service
systemctl enable docker.service

reboot
