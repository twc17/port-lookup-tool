!#/usr/bin/env bash

# Only wanna do this once..
sudo apt-get update

# Install Python3 and Paramiko lib
sudo apt-get install -y build-essential libssl-dev libffi-dev python-dev
sudo apt-get install -y python3
sudo apt-get install -y python3-pip
sudo apt-get install -y libapache2-mod-python
sudo apt-get install -y libapache2-mod-python-doc
# Paramiko dependencies
sudo pip3 install paramiko

# Install Apache web server, and link /var/www to the shared /vagrant directory
sudo apt-get install -y apache2
if ! [ -L /var/www ]; then
	sudo rm -rf /var/www
	sudo ln -fs /vagrant /var/www
fi

# Remove default Apache site
sudo rm -r /etc/apache2/sites-available/*
sudo rm -r /etc/apache2/sites-enabled/*

# Make directory for SSL certs
sudo mkdir /etc/apache2/certs

# Create SSL certs
__cert="/etc/apache2/certs/cert.crt"
__key="/etc/apache2/certs/cert.key"
sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout "$__key" -out "$__cert" -subj "/O=PITT"

# Copy over Apache config file for website
sudo cp /vagrant/extras/port-lookup-tool-apache.conf /etc/apache2/sites-available/port-lookup-tool-apache.conf
sudo ln -fs /etc/apache2/sites-available/port-lookup-tool-apache.conf /etc/apache2/sites-enabled/port-lookup-tool-apache.conf

# Load CGI and SSL module
sudo a2enmod cgid
sudo a2enmod ssl

# Restart Apache
sudo service apache2 restart

# Install VIM because it's the best editor in the world
sudo apt-get install -y vim
# Don't forget my .rc file
sudo cp /vagrant/extras/vimrc ~/.vimrc
