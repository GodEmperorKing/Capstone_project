############# public subnets

resource "aws_subnet" "public-subnet-eu-west-3a" {
  vpc_id = aws_vpc.fortressmaximus-vpc.id         # which vpc to create
  # step 1: create VPC
  # step 2: get VPC ID
  # step 3: add VPC ID into vpc_id argument in this subnet
  # which VPC to creste subnet in
  cidr_block = "10.109.1.0/24"
  availability_zone = "eu-west-3a"
  map_public_ip_on_launch = true

  tags = {
    Name = "public-subnet-eu-west-3a"
  }
}

resource "aws_subnet" "public-subnet-eu-west-3b" {
  vpc_id = aws_vpc.fortressmaximus-vpc.id        # which vpc to create
  cidr_block = "10.109.2.0/24"
  availability_zone = "eu-west-3b"
  map_public_ip_on_launch = true

  tags = {
    Name = "public-subnet-eu-west-3b"
  }
}

resource "aws_subnet" "public-subnet-eu-west-3c" {
  vpc_id = aws_vpc.fortressmaximus-vpc.id         # which vpc to create
  cidr_block = "10.109.3.0/24"
  availability_zone = "eu-west-3c"
  map_public_ip_on_launch = true

  tags = {
    Name = "public-subnet-eu-west-3c"
  }
}

# ############### private subnets

resource "aws_subnet" "private-subnet-eu-west-3a" {
  vpc_id = aws_vpc.fortressmaximus-vpc.id       # which vpc to create
  cidr_block = "10.109.11.0/24"
  availability_zone = "eu-west-3a"

  tags = {
    Name = "private-subnet-eu-west-3a"
  }
}

resource "aws_subnet" "private-subnet-eu-west-3b" {
  vpc_id = aws_vpc.fortressmaximus-vpc.id        # which vpc to create
  cidr_block = "10.109.12.0/24"
  availability_zone = "eu-west-3b"

  tags = {
    Name = "private-subnet-eu-west-3b"
  }
}

resource "aws_subnet" "private-subnet-eu-west-3c" {
  vpc_id = aws_vpc.fortressmaximus-vpc.id        # which vpc to create
  cidr_block = "10.109.13.0/24"
  availability_zone = "eu-west-3c"

  tags = {
    Name = "private-subnet-eu-west-3c"
  }
}