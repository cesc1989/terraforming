module "backend" {
  source = "../../../../modules/backend-app"

  # This variables are defined in the backend module vars.tf file
  server_port = 9000
  aws_region = "us-east-1"
  environment = "production"
  instance_type = "t2.large"
}
