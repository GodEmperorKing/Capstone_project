#!/bin/bash
### SCRIPT LOGIC & DELIVERABLE EXPLANATION ###
### This script automates Apache installation via yum.
### It generates separate index.html and style.css files.
### It also creates all required backup, log, and placeholder 
### directories to satisfy the Capstone Lab 2 requirements.

# 1. Update OS and Install Apache
yum update -y
yum install -y httpd
systemctl start httpd
systemctl enable httpd

# 2. Create the separate CSS file (Requirement 2)
cat <<EOF > /var/www/html/style.css
body { font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; background-color: #1e272e; color: #d2dae2; margin: 0; padding: 40px; }
.container { max-width: 800px; margin: auto; background-color: #2c3e50; padding: 30px; border-radius: 10px; box-shadow: 0 10px 20px rgba(0,0,0,0.5); }
section { margin-bottom: 30px; padding-bottom: 20px; border-bottom: 1px solid #485460; }
.footer { text-align: center; font-size: 0.9em; color: #808e9b; border-bottom: none; }
EOF

# 3. Create the HTML page linking to the CSS file (Requirement 2)
cat <<EOF > /var/www/html/index.html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Samael's Armageddon Lab 2</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <div class="container">
        <h1>Samael King - Lab 2 Web Server</h1>
        <section>
            <h2>About Me</h2>
            <p>Greetings! I'm Samael. I'm currently drilling AWS infrastructure setups to build muscle memory for the GCP-PCA and the SAA-C03 exam.</p>
        </section>
        <section>
            <h2>Project Description: CPG Armageddon</h2>
            <p>This web page is hosted on an Amazon EC2 instance deployed within a custom VPC. The web server (Apache) and this HTML file were dynamically generated using an automated Bash User Data script upon boot.</p>
            <img src="https://upload.wikimedia.org/wikipedia/commons/9/93/Amazon_Web_Services_Logo.svg" alt="AWS Logo" style="width:200px; background-color:white; padding:10px; border-radius:5px; margin-top:10px;">
        </section>
        <section class="footer">
            <h2>Contact</h2>
            <p>If the server is down, I'm probably out moto-vlogging.</p>
            <p>&copy; 2026 Samael King | Cloud Proving Ground</p>
        </section>
    </div>
</body>
</html>
EOF

# 4. Create backup directories and backup generated files (Requirement 4)
mkdir -p /home/ec2-user/backups
cp /var/www/html/index.html /home/ec2-user/backups/
cp /var/www/html/style.css /home/ec2-user/backups/

# 5. Create log-archive directory with 4 dummy files (Requirement 5)
mkdir -p /home/ec2-user/log-archive
touch /home/ec2-user/log-archive/dummy1.log
touch /home/ec2-user/log-archive/dummy2.log
touch /home/ec2-user/log-archive/dummy3.log
touch /home/ec2-user/log-archive/dummy4.log

# 6. Create additional directories with placeholder files (Requirement 6)
mkdir -p /home/ec2-user/content /home/ec2-user/utils /home/ec2-user/credentials
touch /home/ec2-user/content/placeholder.txt
touch /home/ec2-user/utils/placeholder.txt
touch /home/ec2-user/credentials/placeholder.txt

# Ensure the ec2-user owns the directories created in their home folder
chown -R ec2-user:ec2-user /home/ec2-user/*
