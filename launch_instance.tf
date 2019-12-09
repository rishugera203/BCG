provider "aws" {
        access_key = "AKIAQUMOET2DURV7SK34"
        secret_key = "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"
        region = "us-east-2"
}

resource "aws_instance" "instance1" {
        ami = "ami-a59b49c6"
        instance_type = "t2.micro"
        key_name = "rishu"
        security_groups= ["sgweb"]
        tags {
         Name = "terraform-instance"
        }
}

provider "aws" {
        access_key = "AKIAQUMOET2DURV7SK34"
        secret_key = "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"
        region = "us-east-1"
}

resource "aws_instance" "instance2" {
        ami = "ami-a59b49c6"
        instance_type = "t2.micro"
        key_name = "rishu"
        security_groups= ["sgweb2"]
        tags {
         Name = "terraform-instance"
        }
}
