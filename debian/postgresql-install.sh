sudo apt update && sudo apt upgrade -y
sudo apt install postgresql postgresql-contrib -y
sudo systemctl status postgresql
sudo systemctl start postgresql
psql --version
sudo -u postgres psql

