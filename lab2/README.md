# EC2 Terraform script


Lab2 is an EC2 website created via terraform scripting and a startup.sh 
bash script file that builds the front end HTML and a;sp a css to include for styling to make it attractive.

To summarize, I have 10 terraform files (*.yf) to do the plumbing for the script and build out the EC2. The startup.sh script file creates the linux web server that hosts the site with apache. Then my script builds out directory paths and I create my index.html web page first then my styles.css file
individually.  After creation, they are placed in the 
/var/www/html directory.

Once that is completed, the script creates a copy of these two files in the backup directory for log purposes. 
Multiple directories and dummy files are dropped into the other directorues.
I have sudo commands I use for tricky copy issues and sudo chown to allow my current account (ec2-user) to be viewed as anowner of the backup folder.
I copy (cp) the files to my ec2-user home directory then move (mv) them into the backup folder under /var/www/html/backup which then keeps my home directoy clean.

Last thing I do is remove temp files nd leave.

The teraform files use version 6.18.0 of Hashicorp's aws provider.
I'm using it because it was reliable version I am familiar with.
My vpc and ec2 are anmed fortressmaximus and I use the IP RANGE 
CIDR Block of 10.107.1.0/24.

Although we were told we did not have to use SSH, I added an SSH entry in 
my security group creation, because I wanted to be able to test it from my CLI.
The Key Pair is an application generated value which exists for the life
of the application. I named it TF_key.pem and this key pair entry for Paris (eu-west-3)can be chedked during execution undet Network & Security. 

The pathing for SSH is constantly generated nd it can be seen when yu  try to connect a terminal session via SSH. Copy and paste it and voila, a ssh server access is granted. 
ex.  ssh -i "TF_key.pem" ec2-user@13.36.176.47

IPAD starts the terraform configuration. terraform apply runs the app .

When I execute the code, the temporary key is downloaded onto my local directory
allowing me to ssh on my machine. It is also inserted into the keypairs list automatically.

When I am done, terraform destroy is run to complete teardown.
The operation removes the keypair file off of my machube and from aws.

Screenshots are stored in lab2/screenshots folder to separate these deliverables from lab1.

The ladies are represented nicely and my 3 chunks of info are displayed on the webpage. Background, font and grid formation satisfy the visual elements.