terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.9"
    }
  }
}

provider "local" {}

variable "aws_environment" {
  type    = string
  default = "dev"

  validation {
    condition     = contains(["dev", "staging", "prod"], var.aws_environment)
    error_message = "L'environnment AWS doit etre strictement l'un des suivants : dev, staging ou prod"
  }
}

variable "storage_size_gb" {
  type    = number
  default = 100

  validation {
    condition     = var.storage_size_gb >= 10 && var.storage_size_gb <= 500
    error_message = "la taille du stockage demandée est comprise entre 10 et 500 Go"
  }
}

resource "local_file" "compliance_status" {
  filename = "./compliance_status.txt"
  content  = <<-EOT
  Environment : ${var.aws_environment}
  Storage size : ${var.storage_size_gb}
  EOT
}
