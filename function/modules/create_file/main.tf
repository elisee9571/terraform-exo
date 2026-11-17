provider "local" {}

locals {
  bucket     = lower(trimspace(var.bucket_name))
  short_name = substr(local.bucket, 0, 15)

  count_instances = length(var.instances_types)
  instance1       = element(var.instances_types, 0)

  gateway       = lookup(var.network_public, "gateway", "igw")
  merge_network = merge(var.network_public, var.network_private)
}

resource "local_file" "s3_and_infra_audit" {
  filename = "./s3_and_infra_audit.txt"
  content  = <<-EOT
  Bucket name : ${local.bucket}
  Short name : ${local.short_name}

  Count instances : ${local.count_instances}
  Instance 1 : ${local.instance1}

  Gateway : ${local.gateway}
  Merge network keys : ${join(", ", keys(local.merge_network))}
  Merge network values : ${join(", ", values(local.merge_network))}
  Merge network jsonencode : ${jsonencode(local.merge_network)}
  EOT
}
