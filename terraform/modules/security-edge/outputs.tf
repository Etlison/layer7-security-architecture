output "cloudfront_domain_name" {
  description = "CloudFront-generated domain name when enabled"
  value       = var.enable_cloudfront ? aws_cloudfront_distribution.main[0].domain_name : null
}

output "cloudfront_distribution_id" {
  description = "CloudFront distribution ID when enabled"
  value       = var.enable_cloudfront ? aws_cloudfront_distribution.main[0].id : null
}

output "waf_web_acl_arn" {
  description = "CloudFront WAF Web ACL ARN"
  value       = aws_wafv2_web_acl.edge.arn
}

output "cognito_user_pool_id" {
  description = "Cognito user pool ID"
  value       = aws_cognito_user_pool.main.id
}

output "cognito_user_pool_client_id" {
  description = "Cognito application client ID"
  value       = aws_cognito_user_pool_client.app.id
}
