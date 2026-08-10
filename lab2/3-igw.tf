resource "aws_internet_gateway" "fortressmaximus-igw" {
  vpc_id = aws_vpc.fortressmaximus-vpc.id

  tags = {
    Name    = "fortressmaximus-igw"
    Service = "application1"
    Owner = "Optimus Prime"
    Planet = "Cybertron"
  }
}
