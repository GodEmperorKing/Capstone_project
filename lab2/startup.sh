#!/bin/bash

# Update server
yum update -y

# Install Apache
yum install httpd -y

# Start Apache
systemctl start httpd

# Start Apache when server is rebooted
systemctl enable httpd

# Create website
cat > /var/www/html/index.html <<EOF
<!DOCTYPE html>
<html>
<head>
    <title>EC2 Startup Script (User Data Automation)</title>
    <link rel="stylesheet" href="style.css">
</head>

<body>

    <h1>EC2 Startup Script (User Data Automation)</h1>

    <img src="https://upload.wikimedia.org/wikipedia/commons/6/69/Dodge_Charger_Scat_Pack_Widebody_%2852979227549%29.jpg"
     alt="Dodge Charger Scat Pack Widebody"
     width="500">

    <div class="section">
        <h2>About This Website</h2>
        <p>This website runs on an EC2 instance.</p>
    </div>

    <div class="section">
        <h2>Startup Script</h2>
        <p>The startup script installed Apache and created these website files.</p>
    </div>

    <div class="section">
        <h2>Group Member Information</h2>
        <p>Name: Jerry Dotson</p>
        <p>Excercise: Create HTML webpage and associated files</p>
    </div>

</body>
</html>
EOF

# Create CSS file
cat > /var/www/html/style.css <<EOF
body {
    font-family: Arial;
    background-color: black;
    text-align: center;
}

h1 {
    background-color: gray;
    color: white;
    padding: 20px;
}

.section {
    background-color: white;
    margin: 20px;
    padding: 15px;
}
EOF

# Create a backup directory
mkdir -p /home/ec2-user/website-backup

# Back up generated website files
cp /var/www/html/index.html /home/ec2-user/website-backup/
cp /var/www/html/style.css /home/ec2-user/website-backup/

# Create log archive directory
mkdir -p /home/ec2-user/log-archive

# Create four dummy log files
touch /home/ec2-user/log-archive/log1.txt
touch /home/ec2-user/log-archive/log2.txt
touch /home/ec2-user/log-archive/log3.txt
touch /home/ec2-user/log-archive/log4.txt

# Create additional directories
mkdir -p /home/ec2-user/content
mkdir -p /home/ec2-user/utils
mkdir -p /home/ec2-user/credentials

# Create placeholder files
touch /home/ec2-user/content/placeholder.txt
touch /home/ec2-user/utils/placeholder.txt
touch /home/ec2-user/credentials/placeholder.txt