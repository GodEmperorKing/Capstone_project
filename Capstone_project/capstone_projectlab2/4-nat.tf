# Elastic IP for NAT Gateway
# NAT gateway needs a static public IP address
resource "aws_eip" "alexis-nat-eip" {
  domain = "vpc"

  tags = {
    Name = "alexis-nat-eip"
  }

  depends_on = [aws_internet_gateway.igw]
}

# NAT Gateway
# Allows resources in private subnets to reach the internet
# but prevents the internet from initiating connections to them
resource "aws_nat_gateway" "main" {
  allocation_id = aws_eip.alexis-nat-eip.id
  subnet_id     = aws_subnet.public-eu-central-1a.id

  tags = {
    Name = "alexis-nat-gateway"
  }

  depends_on = [aws_internet_gateway.igw]
}