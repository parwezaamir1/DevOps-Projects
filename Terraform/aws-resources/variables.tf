variable "ports" {
  type = list(number)
}

variable "instance_type" {
  type = string
}

variable "region" {
  type = string
}

variable "image_name" {
  type = string
}

variable "key_name" {
  type = string
}

variable "iamusers" {
  type = list(string)
}

variable "vpc_cidr" {}
variable "project_name" {}
variable "public_subnet_az1_cidr" {}
variable "public_subnet_az2_cidr" {}
variable "private_app_subnet_az1_cidr" {}
variable "private_app_subnet_az2_cidr" {}
variable "domain_name" {}
variable "alternative_name" {}




