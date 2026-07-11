output "vpc_id" {
  description = "VPC ID"
  value       = module.network.vpc_id
}

output "public_subnet_ids" {
  description = "Public subnet IDs"
  value       = module.network.public_subnet_ids
}

output "private_subnet_ids" {
  description = "Private subnet IDs"
  value       = module.network.private_subnet_ids
}

output "eks_cluster_name" {
  description = "EKS cluster name"
  value       = module.eks.cluster_name
}

output "security_data_lake_bucket" {
  description = "Security data lake S3 bucket"
  value       = module.logging_analytics.security_data_lake_bucket
}

output "kinesis_stream_name" {
  description = "Kinesis stream name when enabled"
  value       = module.logging_analytics.kinesis_stream_name
}

output "cloudfront_domain_name" {
  description = "CloudFront domain name when enabled"
  value       = module.security_edge.cloudfront_domain_name
}

output "waf_web_acl_arn" {
  description = "CloudFront WAF Web ACL ARN"
  value       = module.security_edge.waf_web_acl_arn
}

output "cognito_user_pool_id" {
  description = "Cognito user pool ID"
  value       = module.security_edge.cognito_user_pool_id
}
