#!/bin/bash
function print_out {
  echo "--------------------------------------------------"
  echo ""
  echo "$1"
  echo ""
  echo "--------------------------------------------------"
}

echo "Welcome to odoo-9 installer for ubuntu 16.04"
echo "Use only for dev, never for production"
echo "Take a cup of cofee while odoo is installing"

print_out "Configure locale"
sudo locale-gen > /dev/null
sudo sh -c "echo 'LANG=en_US.UTF-8\nLC_ALL=en_US.UTF-8' > /etc/default/locale"
sudo sh -c 'echo "LC_ALL=en_US.UTF-8" > /etc/environment'

print_out "Update apt db"
sudo apt-get update -y > /dev/null


print_out "Install git and vim"
sudo apt-get install git vim  -y > /dev/null

print_out "Install odoo dev dependencies (it may take a long time)"
sudo apt-get install libxml2-dev libxslt1-dev python-dev libldap2-dev libsasl2-dev build-essential python-pil python-lxml python-ldap python-dev libldap2-dev libsasl2-dev python-setuptools libxml2-dev libxslt1-dev libjpeg-dev python-pip gdebi python3-dev python3-psycopg2 libpq-dev -y > /dev/null

print_out "Install postgresql"
sudo apt-get install postgresql postgresql-contrib -y > /dev/null

print_out "Install npm and node"
sudo apt-get install npm nodejs -y > /dev/null

print_out "Configure npm and node"
sudo npm install -g less less-plugin-clean-css -y > /dev/null
sudo ln -s /usr/bin/nodejs /usr/bin/node > /dev/null


print_out "Download and install wkhtmltox"
cd /tmp
wget -q http://download.gna.org/wkhtmltopdf/0.12/0.12.2.1/wkhtmltox-0.12.2.1_linux-trusty-amd64.deb > /dev/null
sudo gdebi -n wkhtmltox-0.12.2.1_linux-trusty-amd64.deb > /dev/null
sudo ln -s /usr/local/bin/wkhtmltopdf /usr/bin/ > /dev/null
sudo ln -s /usr/local/bin/wkhtmltoimage /usr/bin/ > /dev/null
rm -fr wkhtmltox-0.12.2.1_linux-trusty-amd64.deb > /dev/null

print_out "Download odoo from github"
git clone --depth=1 --branch=9.0 https://github.com/odoo/odoo.git ~/odoo-dev/odoo > /dev/null

print_out "Install pip dependencies for odoo (it may take a log time)"
sudo -H pip install --upgrade pip > /dev/null
sudo apt-get install libxml2-dev libxslt1-dev python-dev libjpeg-dev libldap2-dev libssl-dev
sudo -H pip install -r ~/odoo-dev/odoo/requirements.txt > /dev/null

print_out "Install lint tool for odoo"
sudo -H pip install --upgrade --pre pylint-odoo > /dev/null

print_out "Create dbuser (vagrant)"
sudo su - postgres -c "createuser -s $(whoami)" > /dev/null

print_out "Create db (v9dev)"
createdb v9dev > /dev/null

print_out "Create user for pgadmin (admin:admin)"
sudo su - postgres -c "createuser -s admin" > /dev/null
sudo -u postgres psql -c "ALTER USER admin WITH PASSWORD 'admin';" > /dev/null

print_out "Configure postgresql to listen in all interfaces"
sudo sed -i "s/^#listen_addresses.*/listen_addresses = '*'/" /etc/postgresql/10/main/postgresql.conf 
sudo sh -c 'echo "host  all   all   all     password" >> /etc/postgresql/10/main/pg_hba.conf'
sudo service postgresql restart
print_out "End of installation"

echo "Login into the VM 'vagrant ssh'"
echo "To start odoo type '~/odoo-dev/odoo/odoo.py -d v9dev'"
echo "Open your browser and go to http://localhost:8069 (admin:admin)"
echo "Enjoy it !"
