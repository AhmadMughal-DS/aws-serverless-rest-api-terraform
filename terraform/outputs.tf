output "api_base_url" {
  description = "Base invoke URL of the HTTP API"
  value       = module.api.api_base_url
}

output "items_endpoint" {
  description = "Full endpoint for the /items resource"
  value       = module.api.items_endpoint
}

output "dynamodb_table" {
  description = "DynamoDB table name"
  value       = module.api.dynamodb_table
}
