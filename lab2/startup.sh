#!/bin/bash
# Use this for your user data (script from top to bottom)
# install httpd (Linux 2 version)
yum update -y
yum install -y httpd
systemctl start httpd
systemctl enable httpd

# Get the IMDSv2 token
TOKEN=$(curl -X PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 21600")

# Background the curl requests
curl -H "X-aws-ec2-metadata-token: $TOKEN" -s http://169.254.169.254/latest/meta-data/local-ipv4 &> /tmp/local_ipv4 &
curl -H "X-aws-ec2-metadata-token: $TOKEN" -s http://169.254.169.254/latest/meta-data/placement/availability-zone &> /tmp/az &
curl -H "X-aws-ec2-metadata-token: $TOKEN" -s http://169.254.169.254/latest/meta-data/network/interfaces/macs/ &> /tmp/macid &
wait

macid=$(cat /tmp/macid)
local_ipv4=$(cat /tmp/local_ipv4)
az=$(cat /tmp/az)
vpc=$(curl -H "X-aws-ec2-metadata-token: $TOKEN" -s http://169.254.169.254/latest/meta-data/network/interfaces/macs/${macid}/vpc-id)

# Get hostname
hostname_value=$(hostname -f)


### part 1 of file snd directory modifications

BASE_DIR=/var/www/html
mkdir -p $BASE_DIR/backup

### create empty files
touch $BASE_DIR/backup/techstuff.txt
touch $BASE_DIR/backup/techstuff2.txt
touch $BASE_DIR/backup/techstuff3.txt
touch $BASE_DIR/backup/techstuff4.txt

### build the css file
cat > /var/www/html/styles.css << EOF
* {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, sans-serif;
            background: #500b96;
            min-height: 100vh;
            padding: 40px 20px;
        }
        
        .container {
            max-width: 1000px;
            margin: 0 auto;
            background: #ffffffff;
            border-radius: 16px;
            padding: 40px;
            box-shadow: 0 20px 60px rgba(0,0,0,0.5);
        }
        
        .grid-container {
            display: flex;
            max-width: 850px;
            /*grid-template-columns: auto auto auto auto;*/
            grid-template-rows: auto auto auto auto;
            background-color: #500b96;
            padding: 10px;
            place-items: center;
        }

        h1 {
            color: #000000;
            font-size: 3rem;
            margin-bottom: 10px;
            text-align: center;
            font-weight: 700;
        }
        
        h2 {
            color: #666666;
            font-size: 1.5rem;
            margin-bottom: 40px;
            text-align: center;
            font-weight: 500;
        }
        
        .hero-image {
            width: 100%;
            max-width: 800px;
            margin: 0 auto 40px;
            display: block;
            border-radius: 12px;
            border: 3px solid #000000;
            box-shadow: 0 8px 24px rgba(0,0,0,0.3);
        }
        
        .details {
            background: #f5f5f5;
            border: 2px solid #333333;
            border-radius: 12px;
            padding: 30px;
            margin-top: 40px;
        }
        
        .details h3 {
            color: #000000;
            font-size: 1.5rem;
            margin-bottom: 20px;
            border-bottom: 3px solid #333333;
            padding-bottom: 10px;
            font-weight: 600;
        }
        
        .detail-item {
            display: flex;
            padding: 15px 0;
            border-bottom: 1px solid #cccccc;
        }
        
        .detail-item:last-child {
            border-bottom: none;
        }
        
        .detail-label {
            font-weight: 600;
            color: #000000;
            min-width: 200px;
            font-size: 1rem;
        }
        
        .detail-value {
            color: #1a1a1a;
            font-family: 'Courier New', monospace;
            background: white;
            padding: 6px 14px;
            border-radius: 6px;
            border: 2px solid #62596d;
            font-size: 0.95rem;
        }

        .divorganizer {
            display: block;
        }

        .base-position {
            display: flex; /* the parent container is a flexbox so we can center
                              the flexbox used to contain the children */
            justify-content: center; /* Centers content horizontally */
            align-items: center;    /* Centers content vertically */
            max-width: 1000px;
        }

        .boatlife {
            display: block;
            margin: auto;
            border-radius: 8px;
            width: 518px;
            height: 345px;
        }

        .beauty {
            display: block;
            margin: 5px;
            border-radius: 8px;
            width: 250px;
            height: 345px;
        }
EOF

### build the html file with include for the styles.css file
cat > /var/www/html/index.html << EOF
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>EC2 CAPSTONE DEMO</title>
    <link href="styles.css" rel="stylesheet">
</head>
  <body>
    <div class="container">
        <h1>CPG CAPSTONE Lab 2</h1>
        <br/>
        <h2>EC2 Instance<br/></h2>
        
        <!-- <img src=https://upload.wikimedia.org/wikipedia/commons/d/de/Suzy_Bae_at_fansigning_on_February_3%2C_2018_%285%29_%28cropped%29.jpg
        class="beauty"> -->
        <div class="base-position">
            <div class="grid-container">
                <div class="grid-template-rows"><img src="https://i.pinimg.com/736x/b6/a8/66/b6a86625f0f5fbd3be1d222a10f986b6.jpg" class="beauty"></div>
                <div class="grid-template-rows"><img src="https://i.pinimg.com/1200x/98/ac/43/98ac436a4fc9e9172f9457810564f408.jpg" class="beauty"></div>
                <div class="grid-template-rows"><img src="https://i.pinimg.com/1200x/cc/9e/cd/cc9ecd6b6003bc999418eea4f6e0f469.jpg" class="beauty"></div>
            </div>
        </div>
        <div class="details">
            <h3>About Me</h3>
            <div class="detail-item">
               <span><p class="detail-label">My name is Eirik Collins. I am a former software developer who 
                    is looking to move into the AWS space. I am fascinated by what cloud can 
                    do and I wish to showcase what we have learned.</p>
                </span>
            </div>
           <div class="detail-item">
                <span>
  
                    <p class="detail-label">I was a former full stack developer, most recetnly with C# in .NET,
                        so I do still retsin my bisses for te microsoft development environment, however, three lifetimes ago,
                        I was a UNIX Developer working on a AIX box at NASA HQ as a government contractor. In this environment,
                        all changes went through a change board which gave us the yes or no to implement the changes after we
                        justified the business need for the changes. Development, Staging and Production were the steps we moved code through
                        under the supervision of the man in the basement with ultimate say so. Some laugh at that concept now,
                        but back then, a mistake in deployment could bring down a working application.
                    </p>
                    </span>
            </div>
        </div>
        <div class="details">
            <h3>Project Description</h3>
            <div class="detail-item">
                <p class="detail-label">This lab introduces Linux automation and cloud
                    initialization by writing a  <br/>startup script that configures an
                    EC2 instance to host a front-facing static website.
                I omplemented a Bash scripting to automate server setup.</p>
                
            </div>
        </div>
        <div class="details">
            <h3>Contact</h3>
            <div class="detail-item">
                <span class="detail-label">Phone Number:</span>
                <span class="detail-value">(720) 361-9063</span>
            </div>
            <div class="detail-item">
                <span class="detail-label">Email Address:</span>
                <span class="detail-value">eirik.collins@gmail.com</span>
            </div>
        </div>
    </div>
</body>
</html>
EOF


### part 2 of directory management on the Amazon Linux Server
cp "$BASE_DIR"/index.html /home/ec2-user/index.html
cp "$BASE_DIR"/styles.css /home/ec2-user/styles.css

### due to Amazon Linux ec2-user permissions, a regular user cannot copy fioles into 
#### either root or /var/www/html paths, so the chown will allow my ec2 user to
#### control the directory
sudo chown -R ec2-user:ec2-user /var/www/html/backup

### testing permissions to figure out what allows mw t move files
mv /home/ec2-user/index.html "$BASE_DIR"/backup/index2.html
mv /home/ec2-user/styles.css "$BASE_DIR"/backup/styles.css

### create empty dorectories
mkdir -p $BASE_DIR/archive
mkdir -p $BASE_DIR/content
mkdir -p $BASE_DIR/utils
mkdir -p $BASE_DIR/credentials

### create a series of dummy files
touch $BASE_DIR/archive/techstuff.txt
touch $BASE_DIR/archive/techstuff2.txt
touch $BASE_DIR/content/dummy1.txt
touch $BASE_DIR/content/dummy2.txt
touch $BASE_DIR/utils/dummy1.txt
touch $BASE_DIR/utils/dummy2.txt
touch $BASE_DIR/credentials/dummy1.txt
touch $BASE_DIR/credentials/dummy2.txt


# Clean up the temp files
rm -f /tmp/local_ipv4 /tmp/az /tmp/macid