terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh_in"
  description = "Security group  SSH access"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
resource "aws_instance" "app_server" {
  ami           = "ami-04823729c75214919"
  instance_type = "t2.micro"
  key_name	= "stefan"
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]
  tags = {
    Name = "tfMachinePleaseToBeLast"
  }
}
