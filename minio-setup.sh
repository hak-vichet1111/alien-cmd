sudo apt-get update

sudo apt-get install wget -y

# Download the latest MinIO binary for Linux: (`uname -m → x86_64`)
wget https://dl.min.io/server/minio/release/linux-amd64/minio

chmod +x minio
sudo mv minio /usr/local/bin/

# create minio directory
sudo mkdir -p /etc/minio

# create configuration file 
mkdir -p /mnt/data
sudo nano /etc/minio/minio.conf 
{
MINIO_ROOT_USER=minioadmin 
MINIO_ROOT_PASSWORD=123456
MINIO_VOLUMES="/mnt/data"
}

# Update systemd 
sudo nano /etc/systemd/system/minio.service
{
[Unit]
Description=MinIO Object Storage
Documentation=https://docs.min.io
Wants=network-online.target
After=network-online.target

[Service]
User=root
Group=root
EnvironmentFile=/etc/minio/minio.conf
ExecStart=/usr/local/bin/minio server $MINIO_VOLUMES
Restart=always
LimitNOFILE=65536

[Install]
WantedBy=multi-user.target
}

# Reload systemd to apply the changes
sudo systemctl daemon-reload
sudo systemctl restart minio
sudo systemctl enable minio
sudo systemctl status minio