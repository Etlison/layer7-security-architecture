variable "project_name" {
  description = "Project name"
  type        = string
}

variable "environment" {
  description = "Deployment environment"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID for VPC Flow Logs"
  type        = string
}

variable "alert_email" {
  description = "Email address for SNS security notifications"
  type        = string
}

variable "enable_kinesis" {
  description = "Whether to create the Kinesis Data Stream"
  type        = bool
  default     = false
}

variable "enable_guardduty" {
  description = "Whether to enable GuardDuty"
  type        = bool
  default     = false
}
