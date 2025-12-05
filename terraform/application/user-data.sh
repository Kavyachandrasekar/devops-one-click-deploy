#!/bin/bash
sudo apt update -y
sudo apt install -y python3 python3-pip

# Create app directory
mkdir -p /opt/app

# Copy app code (Terraform will handle this in later steps)
cat << 'EOF' > /opt/app/server.py
from flask import Flask

app = Flask(__name__)

@app.route("/")
def home():
    return "Hello from Flask API running in Auto Scaling Group!"

@app.route("/health")
def health():
    return "ok"

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8080)
EOF

pip3 install flask

# Create systemd service to run Flask on boot
cat << 'EOF' > /etc/systemd/system/flask.service
[Unit]
Description=Flask API Service
After=network.target

[Service]
User=root
WorkingDirectory=/opt/app
ExecStart=/usr/bin/python3 /opt/app/server.py
Restart=always

[Install]
WantedBy=multi-user.target
EOF

systemctl daemon-reload
systemctl enable flask
systemctl start flask





