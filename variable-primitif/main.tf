terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.9"
    }
  }
}

provider "local" {}

variable "aws_region" {
  type    = string
  default = "eu-west-3"
}

variable "instance_count" {
  type    = number
  default = 2
}

variable "enable_monitoring" {
  type    = bool
  default = true
}

resource "local_file" "aws_deployment" {
  filename = "./aws_deployment.txt"
  content  = <<-EOT
  Region : ${var.aws_region}
  Instance count : ${var.instance_count}
  Monitoring : ${var.enable_monitoring}
  EOT
}
