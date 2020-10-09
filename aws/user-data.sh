#!/bin/bash

echo "installing software for ec2 instance"
# Install Docker
sudo amazon-linux-extras install docker
sudo service docker start
sudo usermod -a -G docker ec2-user

# Install git
sudo yum update -y
sudo yum install git -y
git version

# Install node
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash
~/.nvm/nvm.sh
nvm install node
node -e "console.log('Running Node.js ' + process.version)"
