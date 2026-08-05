#!/bin/bash


yum update -y
amazon-linux-extras install nginx1 -y || yum install -y nginx
systemctl start nginx
systemctl enable nginx


mkdir -p /usr/share/nginx/html/css
mkdir -p /usr/share/nginx/html/images


mkdir -p /home/ec2-user/backup
mkdir -p /home/ec2-user/log-archive
mkdir -p /home/ec2-user/content
mkdir -p /home/ec2-user/utils
mkdir -p /home/ec2-user/credentials


touch /home/ec2-user/log-archive/log1.txt
touch /home/ec2-user/log-archive/log2.txt
touch /home/ec2-user/log-archive/log3.txt
touch /home/ec2-user/log-archive/log4.txt


touch /home/ec2-user/content/content.txt
touch /home/ec2-user/utils/utils.txt
touch /home/ec2-user/credentials/credentials.txt


curl -L "https://wallpaperaccess.com/full/8351167.jpg" -o /usr/share/nginx/html/images/cloud.jpg


cat <<EOF > /usr/share/nginx/html/index.html
<!DOCTYPE html>
<html>
<head>
    <title>Chris Jamieson - Linux Automation Lab</title>
    <link rel="stylesheet" href="css/style.css">
</head>

<body>

<header>
    <h1>Chris Jamieson</h1>
    <p>Linux Automation and Cloud Initialization Lab</p>
</header>

<section>
    <h2>About Me</h2>
    <p>I am learning Linux administration, Bash scripting, and AWS cloud automation.</p>
</section>

<section>
    <h2>Project Description</h2>
    <p>This website was automatically deployed using an EC2 User Data startup script.</p>
</section>

<section>
    <h2>Cloud Automation</h2>
    <p>The script installed NGINX, created HTML and CSS files, generated directories, downloaded an image, and configured the web server.</p>

    <img src="images/cloud.jpg" alt="Cloud Lab Image">

</section>

<footer>
    <p>Contact: cjjamieson1983@gmail.com | Cloud Initialization Lab</p>
</footer>

</body>
</html>
EOF


cat <<EOF > /usr/share/nginx/html/css/style.css
body {
    background-color: lightblue;
    font-family: Arial, sans-serif;
    margin: 20px;
}

header {
    background-color: navy;
    color: white;
    text-align: center;
    padding: 15px;
}

section {
    background-color: white;
    padding: 15px;
    margin: 15px;
    border-radius: 10px;
}

img {
    width: 400px;
    max-width: 100%;
    display: block;
    margin-top: 15px;
}

footer {
    background-color: navy;
    color: white;
    text-align: center;
    padding: 10px;
}
EOF


cp -r /usr/share/nginx/html /home/ec2-user/backup/


systemctl restart nginx