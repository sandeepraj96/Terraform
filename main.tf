resource "aws_vpc" "myvpc" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "mysubnet" {
  vpc_id     = aws_vpc.myvpc.id
  cidr_block = "10.0.1.0/24"
}

resource "aws_security_group" "mysg" {
  name        = "mysg"
  description = "allowing all ports"

  ingress {
    description = "Allow Inbound HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow Inbound HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "myinstance" {
  ami                    = "ami-0614680123427b75e"
  instance_type          = "t2.micro"
  key_name               = var.mykey
  vpc_security_group_ids = [var.mysg]
  subnet_id              = var.mysubnet

  tags = {
    Name = "Sandy"
  }
}


resource "aws_s3_bucket" "mys3buck" {
  bucket        = var.mys3buck
  force_destroy = true
}


resource "aws_s3_bucket_public_access_block" "mys3" {
  bucket = aws_s3_bucket.mys3buck.id


  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_versioning" "s3_versioning" {
  bucket = aws_s3_bucket.mys3buck.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_dynamodb_table" "mydydr" {
  name             = var.mydydr
  read_capacity  = 10
  write_capacity = 10
  hash_key         = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }
}



# resource "aws_instance" "myinstance" {
#    ami = var.ami
#    for_each = {
#     key1 = "t2.micro"
#     key2 = "t2.micro"
#    }
#    instance_type = each.value
#    key_name = each.key
#   }
