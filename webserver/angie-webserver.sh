# create user op
sudo adduser op

# add apt repo
apt-get install -y ca-certificates curl

curl -o /etc/apt/trusted.gpg.d/angie-signing.gpg \
            https://angie.software/keys/angie-signing.gpg

echo "deb https://download.angie.software/angie/$(. /etc/os-release && echo "$ID/$VERSION_ID $VERSION_CODENAME") main" \
    | sudo tee /etc/apt/sources.list.d/angie.list > /dev/null




apt update

# install angie
apt-get install -y angie angie-module-brotli angie-module-zstd
sudo apt install -y angie


