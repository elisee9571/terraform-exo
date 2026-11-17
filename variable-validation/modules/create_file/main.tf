provider "local" {}

resource "local_file" "compliance_status" {
  filename = "./compliance_status.txt"
  content  = <<-EOT
  Environment : ${var.aws_environment}
  Storage size : ${var.storage_size_gb}
  EOT
}
