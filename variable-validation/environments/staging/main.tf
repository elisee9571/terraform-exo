module "create_file" {
  source = "../../modules/create_file"

  aws_environment = "staging"
  storage_size_gb = 100
}