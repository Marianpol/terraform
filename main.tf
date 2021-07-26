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
  ami                    = var.aws_ami_id
  instance_type          = "t2.micro"
  vpc_security_group_ids = ["sg-0c6973f46f7c8b96e"]

  tags = {
    Name = "TerraformTraining"
  }
}

resource "aws_security_group" "allow_http" {
  name        = "http_allow"
  description = "Allow traffic by HTTP"
  vpc_id      = "vpc-c369e9a9"

  ingress {
    description = "Allow HTTP inboud traffic"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["172.0.0.0/24"]
  }

  egress {
    description = "Allow HTTP outbound traffic"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["128.0.0.0/1"]
  }
}

resource "aws_s3_bucket" "ci-bucket" {
  bucket = var.aws_bucket_name
  acl    = "private"
  force_destroy = true

  versioning {
    enabled = true
  }

  tags = {
    Name         = "my-bucket"
    Envirionment = "private"
  }
}