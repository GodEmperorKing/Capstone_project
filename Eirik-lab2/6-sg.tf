resource "aws_security_group" "fortressmaximus-sg" {
  name        = "fortressmaximus-sg"
  vpc_id      = aws_vpc.fortressmaximus-vpc.id

  tags = {
    Name = "fortressmaximus-sg"
  }
}

resource "aws_vpc_security_group_ingress_rule" "fortressmaximus-sg-ssh" {
  security_group_id = aws_security_group.fortressmaximus-sg.id
  description       = "SSH"
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22

  tags = {
    Name = "SSH"
  }
}

resource "aws_vpc_security_group_ingress_rule" "fortressmaximus-sg-http" {
  security_group_id = aws_security_group.fortressmaximus-sg.id
  description       = "HTTP"
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80

  tags = {
    Name = "HTTP"
  }
}

resource "aws_vpc_security_group_egress_rule" "fortressmaximus-sg-allow-all-traffic" {
  security_group_id = aws_security_group.fortressmaximus-sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}


######################### SG for ping

resource "aws_security_group" "ping-sg" {
  name        = "ping-sg"
  vpc_id      = aws_vpc.fortressmaximus-vpc.id

  tags = {
    Name = "ping-sg"
  }
}

resource "aws_vpc_security_group_ingress_rule" "icmp-ping" {
  security_group_id = aws_security_group.ping-sg.id
  description       = "icmp-ping"
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"

  tags = {
    Name = "icmp-ping"
  }
}


resource "aws_vpc_security_group_egress_rule" "egress-for-ping" {
  security_group_id = aws_security_group.ping-sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"

  tags = {
    Name = "egress-for-ping"
  }
}