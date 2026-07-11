variable "project_name" {
  description = "Project name"
  type        = string
}

variable "environment" {
  description = "Deployment environment"
  type        = string
}

variable "eks_version" {
  description = "Kubernetes version for the EKS cluster"
  type        = string
}

variable "subnet_ids" {
  description = "Private subnet IDs for the EKS cluster and node group"
  type        = list(string)
}
