# Base install.

echo "\nBase installation\n" 

apt-get update
apt-get -y upgrade
apt-get -y install linux-headers-$(uname -r)

#sed -i -e 's/Defaults\s\+env_reset/Defaults\texempt_group=sudo' /etc/sudoers
sed -i -e 's/%sudo\tALL=(ALL:ALL)\sALL/%sudo\tALL=NOPASSWD:ALL/g' /etc/sudoers
sed -i "s/^.*requiretty/#Defaults requiretty/" /etc/sudoers

# Install MC.
apt-get -y install mc

# Install curl
apt-get -y install curl

apt-get -y install software-properties-common

# Make ssh faster by not waiting on DNS.
echo "UseDNS no" >> /etc/ssh/sshd_config

# NTP for useful times in logs.
apt-get -y install ntp ntpdate ntp-doc
systemctl enable ntp.service

cat > /etc/ntp.conf << EOM
server ntp1.ericsson.se
server ntp2.ericsson.se
EOM

systemctl start ntp.service
