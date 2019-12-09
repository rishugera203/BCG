# Define VPC

resource "aws_vpc" "default" {
  cidr_block = "${var.vpc_cidr}"
  enable_dns_hostnames = true

  tags {
    Name = "vpc"
  }
}


# Define the public subnet

resource "aws_subnet" "public-subnet" {
  vpc_id = "${aws_vpc.default.id}"
  cidr_block = "${var.public_subnet_cidr}"
  availability_zone = "us-east-2"

  tags {
    Name = "Web Public Subnet"
  }
}


# Define the private subnet

resource "aws_subnet" "private-subnet" {
  vpc_id = "${aws_vpc.default.id}"
  cidr_block = "${var.private_subnet_cidr}"
  availability_zone = "us-east-2"

  tags {
    Name = "Database Private Subnet"
  }
}


# Define the internet gateway

resource "aws_internet_gateway" "gw" {
  vpc_id = "${aws_vpc.default.id}"

  tags {
    Name = "VPC IGW"
  }
}


# Define the route table
resource "aws_route_table" "web-public-rt" {
  vpc_id = "${aws_vpc.default.id}"
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.gw.id}"
  }
  tags {
    Name = "Public Subnet RT"
  }
}


# Assign the route table to the public Subnet

resource "aws_route_table_association" "web-public-rt" {
  subnet_id = "${aws_subnet.public-subnet.id}"
  route_table_id = "${aws_route_table.web-public-rt.id}"
}

# Define the security group for public subnet

resource "aws_security_group" "sgweb" {
  name = "vpc_web"
  description = "Allow incoming HTTP connections & SSH access"
  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = -1
    to_port = -1
    protocol = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  vpc_id="${aws_vpc.default.id}"
  tags {
    Name = "Web Server SG"
  }
}


# Define the security group for private subnet

resource "aws_security_group" "sgdb"{
  name = "sg_web"
  description = "Allow traffic from public subnet"
  ingress {
    from_port = 3306
    to_port = 3306
    protocol = "tcp"
    cidr_blocks = ["${var.public_subnet_cidr}"]
  }
  ingress {
    from_port = -1
    to_port = -1
    protocol = "icmp"
    cidr_blocks = ["${var.public_subnet_cidr}"]
  }
  vpc_id = "${aws_vpc.default.id}"
  tags {
    Name = "DB SG"
  }
}


# VPC for NAT
resource "aws_route_table" "nat-private" {
    vpc_id = "${aws_vpc.default.id}"
    route {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = "${aws_nat_gateway.nat-gw.id}"
    }

    tags {
        Name = "nat-private1"
    }



###AZ-2###


# Define the public subnet2

resource "aws_subnet" "public-subnet2" {
  vpc_id = "${aws_vpc.default.id}"
  cidr_block = "${var.public_subnet_cidr}"
  availability_zone = "us-east-1"

  tags {
    Name = "Web Public Subnet2"
  }
}


# Define the private subnet2

resource "aws_subnet" "private-subnet2" {
  vpc_id = "${aws_vpc.default.id}"
  cidr_block = "${var.private_subnet_cidr}"
  availability_zone = "us-east-1"

  tags {
    Name = "Database Private Subnet2"
  }
}



# Define the route table

resource "aws_route_table" "web-public-rt2" {
  vpc_id = "${aws_vpc.default.id}"
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.gw.id}"
  }
  tags {
    Name = "Public Subnet RT2"
  }
}


# Assign the route table to the public Subnet2

resource "aws_route_table_association" "web-public-rt2" {
  subnet_id2 = "${aws_subnet.public-subnet.id}"
  route_table_id2 = "${aws_route_table.web-public-rt2.id}"
}


# Define the security group for public subnet2

resource "aws_security_group" "sgweb2" {
  name = "vpc_web"
  description = "Allow incoming HTTP connections & SSH access"
  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = -1
    to_port = -1
    protocol = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  vpc_id="${aws_vpc.default.id}"
  tags {
    Name = "Web Server SG2"
  }
}


# Define the security group for private subnet2

resource "aws_security_group" "sgdb2"{
  name = "sg_web2"
  description = "Allow traffic from public subnet2"
  ingress {
    from_port = 3306
    to_port = 3306
    protocol = "tcp"
    cidr_blocks = ["${var.public_subnet_cidr}"]
  }
  ingress {
    from_port = -1
    to_port = -1
    protocol = "icmp"
    cidr_blocks = ["${var.public_subnet_cidr}"]
  }
  vpc_id = "${aws_vpc.default.id}"
  tags {
    Name = "DB SG2"
  }
}


# VPC for NAT2
resource "aws_route_table" "nat-private2" {
    vpc_id = "${aws_vpc.default.id}"
    route {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id2 = "${aws_nat_gateway.nat-gw.id}"
    }

    tags {
        Name = "nat-private2"
    }
