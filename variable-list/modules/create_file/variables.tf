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
