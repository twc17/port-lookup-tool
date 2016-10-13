!#/usr/bin/env bash

# Only wanna do this once..
apt-get update

# Install Python3 and Paramiko lib
apt-get install -y build-essential libssl-dev libffi-dev python-dev
apt-get install -y python3
apt-get install -y python-pip
apt-get install -y ipython
apt-get install -y libapache2-mod-python
apt-get install -y libapache2-mod-python-doc
# Paramiko dependencies
pip install six
pip install cryptography
pip install paramiko

# Copy Paramiko over to Python3 directory
cp -r /usr/local/lib/python2.7/dist-packages/paramiko/ /usr/local/lib/python3.4/dist-packages/
cp -r /usr/lib/python2.7/dist-packages/six.py /usr/local/lib/python3.4/dist-packages/
cp -r /usr/local/lib/python2.7/dist-packages/cryptography/ /usr/local/lib/python3.4/dist-packages/
cp -r /usr/local/lib/python2.7/dist-packages/pyasn1 /usr/local/lib/python3.4/dist-packages/

# Install Apache web server, and link /var/www to the shared /vagrant directory
apt-get install -y apache2
if ! [ -L /var/www ]; then
	rm -rf /var/www
	ln -fs /vagrant /var/www
fi

# Remove default Apache site
rm -r /etc/apache2/sites-available/*
rm -r /etc/apache2/sites-enabled/*

# Copy over Apache config file for website
cp /vagrant/extras/port-lookup-tool-apache.conf /etc/apache2/sites-available/port-lookup-tool-apache.conf
ln -fs /etc/apache2/sites-available/port-lookup-tool-apache.conf /etc/apache2/sites-enabled/port-lookup-tool-apache.conf

# Load CGI module
a2enmod cgi

# Restart Apache
service apache2 restart

# Install VIM because it's the best editor in the world
apt-get install -y vim
# Don't forget my .rc file
cp /vagrant/extras/vimrc ~/.vimrc
