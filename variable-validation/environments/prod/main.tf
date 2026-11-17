module "create_file" {
  source = "../../modules/create_file"

  aws_environment = "prod"
  storage_size_gb = 200
}