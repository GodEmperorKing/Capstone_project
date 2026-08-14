resource "aws_instance" "alexis-ec2" {
  ami           = "ami-01a612f2c60d80101" # eu-central-1
  instance_type = "t3.micro"
  security_groups = [aws_security_group.alexis_sg.id]
  subnet_id = aws_subnet.public-eu-central-1a.id
  associate_public_ip_address = true


user_data = file("startup.sh")

  tags = {
    Name = "alexis-ec2"
  }
}