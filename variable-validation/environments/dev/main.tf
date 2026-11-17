module "create_file" {
  source = "../../modules/create_file"

  aws_environment = "dev"
  storage_size_gb = 10
}