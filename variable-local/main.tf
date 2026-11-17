terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.9"
    }
  }
}

provider "local" {}

variable "project_name" {
  type    = string
  default = "ecommerce"
}

variable "environment" {
  type    = string
  default = "production"
}

variable "owner" {
  type    = string
  default = "equipe-cloud"
}

locals {
  resource_prefix = "${var.environment}-${var.project_name}"

  common_tags = {
    Project     = var.project_name
    Environment = var.environment
    Owner       = var.owner
  }
}

resource "local_file" "aws_tags" {
  filename = "./aws_tags.txt"
  content  = <<-EOT
  Name : ${local.resource_prefix}

  Project : ${local.common_tags.Project}
  Environment : ${local.common_tags.Environment}
  Owner : ${local.common_tags.Owner}
  EOT
}
