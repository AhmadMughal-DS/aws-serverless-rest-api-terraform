output "api_base_url" {
  description = "Base invoke URL of the HTTP API"
  value       = aws_apigatewayv2_api.http.api_endpoint
}

output "items_endpoint" {
  description = "Full endpoint for the /items resource"
  value       = "${aws_apigatewayv2_api.http.api_endpoint}/items"
}

output "dynamodb_table" {
  description = "Name of the DynamoDB table"
  value       = aws_dynamodb_table.items.name
}
