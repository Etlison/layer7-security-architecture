variable "project_name" {
  description = "Project name used to name security-edge resources"
  type        = string
}

variable "environment" {
  description = "Deployment environment"
  type        = string
}

variable "enable_cloudfront" {
  description = "Whether Terraform creates a new CloudFront distribution"
  type        = bool
  default     = false
}

variable "origin_domain_name" {
  description = "CloudFront origin DNS hostname, normally an ALB DNS name"
  type        = string
  default     = ""

  validation {
    condition = (
      var.enable_cloudfront == false ||
      (
        length(trimspace(var.origin_domain_name)) > 0 &&
        !startswith(lower(trimspace(var.origin_domain_name)), "http://") &&
        !startswith(lower(trimspace(var.origin_domain_name)), "https://") &&
        length(regexall("/", trimspace(var.origin_domain_name))) == 0
      )
    )

    error_message = "When CloudFront is enabled, origin_domain_name must be a DNS hostname without http://, https://, or a path."
  }
}

variable "origin_protocol_policy" {
  description = "Protocol CloudFront uses to connect to its origin"
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
  description = "Optional ACM certificate ARN from us-east-1"
  type        = string
  default     = ""
}
