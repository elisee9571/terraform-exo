variable "bucket_name" {
  type    = string
  default = " Mon-Super-Bucket-S3-Donnees-Clients "
}

variable "instances_types" {
  type    = list(string)
  default = ["t3.micro", "t3.medium", "m5.large"]
}

variable "network_public" {
  type = map(string)
  default = {
    subnet  = "10.0.10.0/24",
    gateway = "igw-1"
  }
}


variable "network_private" {
  type = map(string)
  default = {
    subnet = "10.0.20.0/24"
  }
}
