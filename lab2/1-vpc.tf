resource "aws_vpc" "fortressmaximus-vpc" {
  cidr_block       = "10.107.0.0/16"
  instance_tenancy = "default"
  enable_dns_hostnames = true
  enable_dns_support = true

  tags = {
    Name = "fortressmaximus-vpc"
    Service = "vpc"
    Owner = "Optimus Prime"
    Planet = "Cybertron"
  }
}

### I made a change of the IP address from 109.x.x.x to 107.x.x.x