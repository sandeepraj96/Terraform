variable "aws_region" {
  type    = string
  default = "ap-south-1"
}

variable "mysubnet" {
  type    = string
  default = "subnet-0139504c9dd8e77c5"
}

variable "mysg" {
  type    = string
  default = "sg-078942407ccc6988e"
}

variable "mykey" {
  type    = string
  default = "terra"
}

variable "mys3buck" {
  type    = string
  default = "s3buck27112024sandy"
}

variable "mydydr" {
  type    = string
  default = "dynamodb"
}

variable "ami" {
  type = string
  default = "ami-0614680123427b75e"
 }