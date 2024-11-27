#!/bin/bash

check_java() { 
	#checking if jdk is installed or not
	if command -v java >/dev/null 2>&1; then
		echo "JAVA ALREADY INSTALLED"
		#if installed then directly goes for jenkins installation
		install_jenkins
	else
		#if not installed then installs jdk-11
		install_java
	fi
}

install_java() {
	echo "Installing OpendJDK 11.."
	sudo apt update > /dev/null
	sudo apt install -y openjdk-11-jdk > /dev/null
	#installs the JDK

	#checks if the jdk is installed properly or not
	if command -v java >/dev/null 2>&1; then
		echo "JAVA INSTALLED SUCCESSFULLY"
		#if installed properly goes for jenkins installation
		install_jenkins
	else
		echo "JAVA INSTALLATION FAILED"
		#displays error and exits the code
		exit 1
	fi
}


install_jenkins() {
	sudo apt update > /dev/null 2>&1
        sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
        https://pkg.jenkins.io/debian/jenkins.io-2023.key > /dev/null 2>&1
	echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc]" \
        https://pkg.jenkins.io/debian binary/ | sudo tee \
        /etc/apt/sources.list.d/jenkins.list > /dev/null
        sudo apt-get install -y jenkins > /dev/null
	#install jenkins if already installed then updates the jenkins
	

	
	if command -v jenkins > /dev/null 2>&1; then
		echo "JENKINS IS READY TO USE"
		#checks if jenkins is ready to use

	else
		echo "ERROR OCCURED"
		exit 1
	fi
}


check_java
