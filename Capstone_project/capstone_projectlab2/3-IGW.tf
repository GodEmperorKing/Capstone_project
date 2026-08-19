resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.alexis_vpc.id

  tags = {
    Name    = "alexis_IGW"
    Service = "application1"
    Owner   = "Luke"
    Planet  = "Musafar"
  }
}