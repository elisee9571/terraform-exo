provider "local" {}

resource "local_file" "aws_deployment" {
  filename = "./aws_deployment.txt"
  content  = <<-EOT
  Region : ${var.aws_region}
  Instance count : ${var.instance_count}
  Monitoring : ${var.enable_monitoring}
  EOT
}
