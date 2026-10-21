output "api_base_url" {
  description = "Base invoke URL"
  value       = aws_apigatewayv2_api.http.api_endpoint
}

output "items_endpoint" {
  description = "Full /items endpoint"
  value       = "${aws_apigatewayv2_api.http.api_endpoint}/items"
}

output "dynamodb_table" {
  description = "DynamoDB table name"
  value       = aws_dynamodb_table.items.name
}
