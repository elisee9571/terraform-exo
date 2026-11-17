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
