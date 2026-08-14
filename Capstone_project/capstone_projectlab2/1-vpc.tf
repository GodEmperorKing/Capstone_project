# this  makes  vpc.id which is aws_vpc.app1.id
resource "aws_vpc" "alexis_vpc" {
  cidr_block = "10.82.0.0/16" 
  enable_dns_support = true
  enable_dns_hostnames = true
   
  tags = {
    Name = "alexis_vpc"
    Service = "vpc"
    Owner = "Chewbacca"
    Planet = "Mustafar"
  }
}