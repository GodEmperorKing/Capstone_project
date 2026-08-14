resource "aws_eip" "fortressmaximus-nat-eip" {
  domain           = "vpc"
  
  tags = {
    Name = "fortressmaximus-nat-eip"
    Service = "application1"
    Owner = "Optimus Prime"
    Planet = "Cybertron"
  }

  depends_on = [ aws_internet_gateway.fortressmaximus-igw ]  # explict dependency 
}

resource "aws_nat_gateway" "fortressmaximus-nat-igw" {
  allocation_id = aws_eip.fortressmaximus-nat-eip.id     # implict dependency for eip
  subnet_id     = aws_subnet.public-subnet-eu-west-3a.id

  tags = {
    Name = "fortressmaximus-nat-igw"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [ aws_internet_gateway.fortressmaximus-igw ]
}