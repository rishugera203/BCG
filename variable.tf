variable "aws_region" {
  description = "Region for the VPC"
  default = "us-east-2"
}

variable "vpc_cidr" {
  description = "CIDR for the VPC"
  default = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR for the public subnet"
  default = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  description = "CIDR for the private subnet"
  default = "10.0.2.0/24"
}

variable "ami" {
  description = "Amazon Linux AMI"
  default = "ami-14c5486b"
}

variable "key_path" {
  description = "SSH Public Key path"
  default = "rishu"
}

variable "aws_region" {
  description = "Region for the VPC"
  default = "us-east-1"
}


  description = "CIDR for the public subnet2"
  default = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  description = "CIDR for the private subnet2"
  default = "10.0.2.0/24"
}

variable "ami" {
  description = "Amazon Linux AMI2"
  default = "ami-14c5486b"
}

