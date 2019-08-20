provider "aws" {
  access_key = "AKIA6HBII7MBY6E5QBBC"
  secret_key = "fQJKi9kC1zRX1bZz3LLFAkzz2LeZdxIBE6XCaIPA"
  region     = "ap-south-1"
}

resource "aws_instance" "example" {
  ami           = "ami-009110a2bf8d7dd0a"
  instance_type = "t2.micro"
}
