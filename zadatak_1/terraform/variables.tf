variable "region" {
  description = "AWS region"
  type        = string
  default = "us-west-1"
}

variable "vpc_cidr_block" {
  description = "AWS VPC cidr block"
  type = string
  default = "10.0.0.0/16"
}

variable "subnet_cidr_block" {
  description = "AWS VPC public subnet cidr block"
  type = string
  default = "10.0.0.0/24"
}

variable "allowed_ssh_cidr" {
  description = "IP/CIDR allowed to SSH into the controller. My IP"
  type        = string
  default = "192.168.0.108/32"
}

variable "public_ssh_key" {
  description = "Public ssh key that is used for conecting to EC2"
  type        = string
  default = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEgA/mRSVaQERxreNY20fDCjoNmG7ZJmzNL421DVevwW mihajlo@mihajlo-HP-250-G6-Notebook-PC"
}

variable "ec2_type" {
  description = "Instance type to use for the instance"
  type = string
  default = "t3.micro"
}

variable "cost_centar" {
  description = "Instance CostCentar variable"
  type = string
  default = "123456"
}
