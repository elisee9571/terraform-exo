module "create_file" {
  source = "../../modules/create_file"

  aws_region        = "eu-west-1"
  instance_count    = 1
  enable_monitoring = false
}
