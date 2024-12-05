output "api_endpoint_url" {
  value = "https://${aws_api_gateway_rest_api.api.id}.execute-api.${var.region}.amazonaws.com/prod"
  description = "The endpoint URL for the deployed API Gateway"
}
