locals {
  name_prefix = var.project_name
}

data "archive_file" "lambda" {
  type        = "zip"
  source_dir  = "${path.module}/../src"
  output_path = "${path.module}/build/handler.zip"
}

module "api" {
  source          = "./modules/api"
  name_prefix     = local.name_prefix
  environment     = var.environment
  aws_region      = var.aws_region
  lambda_zip_path = data.archive_file.lambda.output_path
  lambda_zip_hash = data.archive_file.lambda.output_base64sha256
}
