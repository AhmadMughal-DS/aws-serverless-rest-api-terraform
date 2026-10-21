variable "name_prefix" {
  description = "Prefix for resource names"
  type        = string
}

variable "environment" {
  description = "Deployment environment"
  type        = string
}

variable "aws_region" {
  description = "AWS region"
  type        = string
}

variable "lambda_zip_path" {
  description = "Path to the packaged Lambda zip"
  type        = string
}

variable "lambda_zip_hash" {
  description = "Base64 sha256 of the Lambda zip"
  type        = string
}
