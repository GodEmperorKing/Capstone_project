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

# create the css file
cat > /var/www/html/styles.css << EOF
* {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            background-color: #000000;
            color: #ffffff;
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            text-align: center;
        }

        header {
            padding: 40px 20px;
        }

        h1 {
            color: #e50914;
            font-size: 2.5rem;
            margin: 0;
        }

        .container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 20px;
            padding: 20px;
            max-width: 1200px;
            margin: 0 auto;
        }

        .containerAlter {
            max-width: 1000px;
            margin: 0 auto;
            background: #320000;    /* rgb(50,0,0) */
            border-radius: 16px;
            padding: 40px;
            box-shadow: 0 20px 60px rgba(0,0,0,0.5);
        }

        .beauty {
            display: block;
            margin: 5px;
            border-radius: 8px;
            width: 250px;
            height: 345px;
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

        .card {
            background-color: #121212;
            border: 1px solid #333333;
            border-radius: 8px;
            width: 300px;
            padding: 20px;
            box-shadow: 0 4px 8px rgba(255, 255, 255, 0.05);
        }

        .card h2 {
            color: #f5f5f5;
            font-size: 1.5rem;
            margin-top: 10px;
        }

        .card p {
            color: #aaaaaa;
            font-size: 0.95rem;
            line-height: 1.4;
        }

        footer {
            padding: 30px;
            color: #666666;
            font-size: 0.8rem;
        }
EOF

# create html and include the styles.css file created above
cat > /var/www/html/index.html << EOF
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Marvel Dark Heroes</title>
    <link href="styles.css" rel="stylesheet">
</head>
  <body>
    <div class="containerAlter">

    <header>
        <h1>CAPSTONE EC2 aka Marvel Dark Heroes</h1>
        <p>Icons of the shadow and night.</p>        
    </header>

    <div class="container">
        <div class="card">
            <h2>Wolverine</h2>
            <p>A man who is the best at what he does</p>
            <img src="https://i.pinimg.com/1200x/33/82/fa/3382fa7e73005470cb28f2a631c3f41f.jpg" class="beauty">
        </div>

        <div class="card">
            <h2>Deadpool</h2>
            <p>The Merc with a mouth /p>
            <img src="https://i.pinimg.com/1200x/97/c5/e4/97c5e4cdd32fad24e847c8c62841ead0.jpg" class="beauty">
        </div>

        <div class="card">
            <h2>Gambit</h2>
            <p>A Caajun Mutant, a former thief, now an X-Men</p>
            <img src="https://i.pinimg.com/736x/3d/f6/0f/3df60f955c16f6b59854455392d9079e.jpg" class="beauty">
        </div>
    </div>
        <div class="details">
            <h3>About Me</h3>
            <div class="detail-item">
               <span><p class="detail-label">My name is Kofa....</p>
                </span>
            </div>
           <div class="detail-item">
                <span>
  
                    <p class="detail-label">Things to say about me
                    </p>
                    </span>
            </div>
        </div>
        <div class="details">
            <h3>Project Description</h3>
            <div class="detail-item">
                <p class="detail-label">This lab introduces Linux automation....</p>
                
            </div>
        </div>
        <div class="details">
            <h3>Contact</h3>
            <div class="detail-item">
                <span class="detail-label">Phone Number:</span>
                <span class="detail-value">(XXX) XXX-XXXX</span>
            </div>
            <div class="detail-item">
                <span class="detail-label">Email Address:</span>
                <span class="detail-value">kofa@hardworking.com/span>
            </div>
        </div>
    </div>

    <footer>
        <p>&copy; 2026 Marvel Heroes Fan Page</p>
    </footer>

</body>
</html>
EOF


# Clean up the temp files
rm -f /tmp/local_ipv4 /tmp/az /tmp/macid