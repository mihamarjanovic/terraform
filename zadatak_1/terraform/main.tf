terraform {
  required_providers {
    aws = { 
      source = "hashicorp/aws"
      version = "~> 6.0"
      }
  }
}

provider "aws" {
  region = var.region
}

locals {
  project     = "jenkins"
  controller_name = "jenkins-controller"
  node_name       = "jenkins-node"
}