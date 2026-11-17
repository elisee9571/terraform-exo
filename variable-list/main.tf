terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.9"
    }
  }
}

provider "local" {}

variable "availability_zones" {
  type    = list(string)
  default = ["eu-west-3a", "eu-west-3b", "eu-west-3c"]
}

variable "subnet_cidrs" {
  type = map(string)
  default = {
    "dev"     = "10.0.1.0/24"
    "staging" = "10.0.2.0/24"
    "prod"    = "10.0.3.0/24"
  }
}

resource "local_file" "network_blueprint" {
  filename = "./network_blueprint.txt"
  content  = <<-EOT
  Availability zones : ${join(", ", var.availability_zones)}
  DEV : ${var.subnet_cidrs["dev"]}
  STAGING : ${lookup(var.subnet_cidrs, "staging", "test")}
  PROD : ${var.subnet_cidrs["prod"]}
  EOT
}
