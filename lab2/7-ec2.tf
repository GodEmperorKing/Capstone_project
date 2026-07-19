resource "aws_instance" "fortressmaximus-ec2" {
  ami           = "ami-09968b16214ef62ce"   #this image is from eu-west-3
  instance_type = "t3.micro"
  #key_name =""
  subnet_id = aws_subnet.public-subnet-eu-west-3a.id
  vpc_security_group_ids = [aws_security_group.ping-sg.id,aws_security_group.fortressmaximus-sg.id]
  associate_public_ip_address = true

  user_data = file("user_data.sh")

  tags = {
    Name = "fortressmaximus-ec2"
  }
}