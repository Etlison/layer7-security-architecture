output "security_data_lake_bucket" {
  description = "Security data lake S3 bucket"
  value       = aws_s3_bucket.data_lake.bucket
}

output "kinesis_stream_name" {
  description = "Kinesis stream name when enabled"
  value       = var.enable_kinesis ? aws_kinesis_stream.security[0].name : null
}

output "cloudtrail_arn" {
  description = "CloudTrail ARN"
  value       = aws_cloudtrail.main.arn
}

output "vpc_flow_log_id" {
  description = "VPC Flow Log ID"
  value       = aws_flow_log.vpc.id
}

output "sns_topic_arn" {
  description = "SNS security alert topic ARN"
  value       = aws_sns_topic.alerts.arn
}
