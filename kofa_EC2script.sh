#!/bin/bash
set -e

# Install Python
dnf update -y
dnf install -y python3

# Create website directory
mkdir -p /var/www/simple-site

# Create a basic webpage
cat > /var/www/simple-site/.html <<'HTML'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>My AWS Test Website</title>

    <style>
        body {
            margin: 0;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            background: #f4f4f4;
            font-family: Arial, sans-serif;
            text-align: center;
        }

        h1 {
            color: #232f3e;
        }

        img {
            width: 90%;
            max-width: 700px;
            height: auto;
            border-radius: 12px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.25);
        }

        p {
            color: #555;
        }
    </style>
</head>About me: God Help Me Get Through Learning to Code.

<body>
    <h1>My AWS EC2 Website Is Live</h1>

    <img
        src="https://images.unsplash.com/photo-1516321318423-f06f85e504b3"
        alt="Laptop displaying computer code"
    >

    <p>Project Description: This website is running on an AWS EC2 instance using Python.</p>
</body>
</html>
HTML

<footer>
    <p>Contact: sankofashakur@gmail.com<p>
</footer>

# Create a systemd service so the website starts automatically
cat > /etc/systemd/system/python-website.service <<'SERVICE'
[Unit]
Description=Simple Python Website
After=network.target

[Service]
Type=simple
User=root
WorkingDirectory=/var/www/simple-site
ExecStart=/usr/bin/python3 -m http.server 80 --bind 0.0.0.0
Restart=always
RestartSec=5

[Install]
WantedBy=multi-user.target
SERVICE

# Start and enable the website
systemctl daemon-reload
systemctl enable python-website
systemctl start python-website
