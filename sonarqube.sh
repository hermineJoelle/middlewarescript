#!/bin/bash

## sonarqube install on centos7
## please run this as a user vagrant

user_name="whoami"
if [ $user_name != vagrant ];

then

echo "must be run as user vagrant!"
exit1
fi

sudo yum update -y
sudo yum install java-11-openjdk-devel -y
sudo yum install java-11-openjdk -y
cd /opt
sudo yum install wget -y
sudo wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-9.3.0.51899.zip
sudo yum install unzip -y
sudo unzip /opt/sonarqube-9.3.0.51899.zip
sudo chown -R vagrant:vagrant /opt/sonarqube-9.3.0.51899
cd /opt/sonarqube-9.3.0.51899/bin/linux-x86-64
sudo firewall-cmd --permanent --add-port=900/tcp
sudo firewall-cmd --reload
./sonar.sh start
echo "installation done sucessfully please get the ip and access the sonarqube on the browser"