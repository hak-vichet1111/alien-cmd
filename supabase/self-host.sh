# Increase git timeout 
git config --global http.postBuffer 524288000

# Clone project 
git clone --filter=blob:none --no-checkout https://github.com/supabase/supabase


# Clone with latest repo 
git clone --depth 1 https://github.com/supabase/supabase


# Clear git cache
git gc --prune=now
git remote prune origin

# Update docker-compose.yml file 
ports:
    - "5433:5432"
    # HOST_PORT:CONTAINER_PORT
    - "localhost:5433 : 5432"
    - "outside-docker:inside"

# check firewall 
sudo iptables -A INPUT -s 192.168.50.203 -j ACCEPT
sudo iptables -A INPUT -s 192.168.50.203 -p tcp --dport 22 -j ACCEPT # for ssh on port 22

# Check port listening
sudo netstat -tulnp | grep 5433
ss -tulnp | grep 5433
docker exec -it supabase-db ss -tulnp | grep 5432
docker ps | grep supabase-db


# Access docker to check port listening 
ss -tulnp | grep 5433
docker exec -it supabase-db bash

# Change this listening
docker exec -it supabase-db bash
nano /var/lib/postgresql/data/postgresql.conf
    listen_addresses = '*'
docker restart supabase-db

