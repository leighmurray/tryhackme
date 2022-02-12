#!/bin/sh
apt update -y
apt upgrade -y
apt install nmap -y
apt install openvpn -y
apt install whois -y
curl -LO https://go.dev/dl/go1.17.6.linux-amd64.tar.gz
tar -C /usr/local -xvf go1.17.6.linux-amd64.tar.gz
rm go1.17.6.linux-amd64.tar.gz
touch /etc/profile
echo 'export PATH=$PATH:/usr/local/go/bin' >> /etc/profile
echo 'export GOPATH="$HOME/go"' >> /home/ubuntu/.profile
echo 'PATH="$GOPATH/bin:$PATH"' >> /home/ubuntu/.profile
su - ubuntu -c 'go install github.com/ffuf/ffuf@latest'
su - ubuntu -c 'mkdir dev && git clone --depth 1 https://github.com/danielmiessler/SecLists.git ~/dev/SecLists'
su - ubuntu -c 'go install github.com/OJ/gobuster/v3@latest'
reboot
