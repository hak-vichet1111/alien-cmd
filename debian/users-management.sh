# Add user to sudo groups
usermod -aG sudo devops
/usr/sbin/usermod -aG sudo devops # add with fullpath 

# check sudo groups 
getent group sudo
getent group sudo | cut -d: -f4 | tr ',' '\n' | wc -l

# allow individual user privileges 
username ALL=(ALL:ALL) ALL