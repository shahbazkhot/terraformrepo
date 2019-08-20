
provider "aws" {
  access_key = "AKIA6HBII7MBUJDCPTYJ"
  secret_key = "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"
  region     = "ap-south-1"
}

variable "ec2-key" {
 default = "MumbaiInstance"
}

variable "ami"{
    default="ami-009110a2bf8d7dd0a"
}


resource "aws_vpc" "july-vpc" {
  cidr_block       = "10.0.0.0/16"


  tags =  {
    Name = "july-vpc"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = "${aws_vpc.july-vpc.id}"

  tags =  {
    Name = "terraform-IGW"
  }
}

resource "aws_subnet" "public-subnet" {
  vpc_id     = "${aws_vpc.july-vpc.id}"
  cidr_block = "10.0.2.0/24"

  tags = {
    Name = "public-subnet-10.0.2.0/24"
  }
}

resource "aws_route_table" "public-rt" {
  vpc_id     = "${aws_vpc.july-vpc.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.igw.id}"
}

  tags = {
    Name = "private-subnet-10.0.1.0/24"
  }
}

