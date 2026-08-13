#These are   for  public

resource "aws_subnet" "public-eu-central-1a" {
  vpc_id                  = aws_vpc.alexis_vpc.id
  cidr_block              = "10.82.1.0/24"
  availability_zone       = "eu-central-1a"
  map_public_ip_on_launch = true

  tags = {
    Name    = "public-eu-central-1a"
    Service = "alexis_vpc"
    Owner   = "Luke"
    Planet  = "Musafar"
  }
}

resource "aws_subnet" "public-eu-central-1b" {
  vpc_id                  = aws_vpc.alexis_vpc.id
  cidr_block              = "10.82.2.0/24"
  availability_zone       = "eu-central-1b"
  map_public_ip_on_launch = true

  tags = {
    Name    = "public-eu-central-1b"
    Service = "alexis_vpc"
    Owner   = "Luke"
    Planet  = "Musafar"
  }
}


resource "aws_subnet" "public-eu-central-1c" {
  vpc_id                  = aws_vpc.alexis_vpc.id
  cidr_block              = "10.82.3.0/24"
  availability_zone       = "eu-central-1c"
  map_public_ip_on_launch = true

  tags = {
    Name    = "public-eu-central-1c"
    Service = "alexis_vpc"
    Owner   = "Luke"
    Planet  = "Musafar"
  }
}

#these are for private
resource "aws_subnet" "private-eu-central-1a" {
  vpc_id            = aws_vpc.alexis_vpc.id
  cidr_block        = "10.82.11.0/24"
  availability_zone = "eu-central-1a"

  tags = {
    Name    = "private-eu-central-1a"
    Service = "alexis_vpc"
    Owner   = "Luke"
    Planet  = "Musafar"
  }
}

resource "aws_subnet" "private-eu-central-1b" {
  vpc_id            = aws_vpc.alexis_vpc.id
  cidr_block        = "10.82.12.0/24"
  availability_zone = "eu-central-1b"

  tags = {
    Name    = "private-eu-central-1b"
    Service = "alexis_vpc"
    Owner   = "Luke"
    Planet  = "Musafar"
  }
}


resource "aws_subnet" "private-eu-central-1c" {
  vpc_id            = aws_vpc.alexis_vpc.id
  cidr_block        = "10.82.13.0/24"
  availability_zone = "eu-central-1c"

  tags = {
    Name    = "private-eu-central-1c"
    Service = "alexis_vpc"
    Owner   = "Luke"
    Planet  = "Musafar"
  }
}