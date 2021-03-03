terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.30.0"
    }
  }
}

provider "aws" {
    access_key = var.aws_access_key
    secret_key = var.aws_secret_key
    region     = "eu-central-1"
}

resource "aws_instance" "example" {
    ami             = var.aws_ami_id
    instance_type   = "t2.micro"

    tags = {
        Name = "LinuxMonthChallenge20"
    }
}