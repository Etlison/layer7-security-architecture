variable "aws_region" {
  description = "Primary AWS region"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Project name used for resource naming"
  type        = string
  default     = "layer7-security"
}

variable "environment" {
  description = "Deployment environment"
  type        = string
  default     = "dev"
}

variable "eks_version" {
  description = "Kubernetes version for the EKS cluster"
  type        = string
  default     = "1.33"
}

variable "alert_email" {
  description = "Email address that receives security alerts"
  type        = string
}

variable "enable_kinesis" {
  description = "Whether Terraform creates the Kinesis Data Stream"
  type        = bool
  default     = false
}

variable "enable_guardduty" {
  description = "Whether Terraform enables GuardDuty"
  type        = bool
  default     = false
}

variable "enable_cloudfront" {
  description = "Whether Terraform creates a new CloudFront distribution"
  type        = bool
  default     = false
}

variable "origin_domain_name" {
  description = "CloudFront origin DNS hostname, normally the ALB DNS name"
  type        = string
  default     = ""
}

variable "origin_protocol_policy" {
  description = "Protocol CloudFront uses to connect to the origin"
  type        = string
  default     = "http-only"

  validation {
    condition = contains(
      [
        "http-only",
        "https-only",
        "match-viewer"
      ],
      var.origin_protocol_policy
    )

    error_message = "origin_protocol_policy must be http-only, https-only, or match-viewer."
  }
}

variable "domain_name" {
  description = "Optional custom CloudFront domain"
  type        = string
  default     = ""
}

variable "certificate_arn" {
  description = "Optional ACM certificate ARN for a custom CloudFront domain"
  type        = string
  default     = ""
}
