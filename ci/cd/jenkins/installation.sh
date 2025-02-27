#!/bin/bash

# Update system packages
sudo apt-get update -y

# Install Java (Jenkins requires Java to run)
sudo apt-get install -y openjdk-17-jdk

# Import Jenkins GPG key and add Jenkins apt repository
sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key

echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc]" \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null

# Update package lists to include Jenkins repository
sudo apt-get update -y

# Install Jenkins
sudo apt-get install -y jenkins

# Start Jenkins
sudo systemctl start jenkins

# Enable Jenkins to start at boot
sudo systemctl enable jenkins

# Print the initial Jenkins admin password
echo "Jenkins installed successfully!"
echo "You can access Jenkins at http://<your-server-ip>:8080"
echo "Use the following command to retrieve your initial Jenkins admin password:"
echo "sudo cat /var/lib/jenkins/secrets/initialAdminPassword"



#To access jenkins : [`http://ip-server:8080](http://ip-server:8080)`
#Get secret key: `cat /var/lib/jenkins/secrets/initialAdminPassword`