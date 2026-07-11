module "network" {
  source = "../../modules/network"

  project_name = var.project_name
  environment  = var.environment
}

module "eks" {
  source = "../../modules/eks"

  project_name = var.project_name
  environment  = var.environment
  eks_version  = var.eks_version
  subnet_ids   = module.network.private_subnet_ids
}

module "logging_analytics" {
  source = "../../modules/logging-analytics"

  project_name     = var.project_name
  environment      = var.environment
  vpc_id           = module.network.vpc_id
  alert_email      = var.alert_email
  enable_kinesis   = var.enable_kinesis
  enable_guardduty = var.enable_guardduty
}

module "security_edge" {
  source = "../../modules/security-edge"

  providers = {
    aws      = aws
    aws.use1 = aws.use1
  }

  project_name           = var.project_name
  environment            = var.environment
  enable_cloudfront      = var.enable_cloudfront
  origin_domain_name     = var.origin_domain_name
  origin_protocol_policy = var.origin_protocol_policy
  domain_name            = var.domain_name
  certificate_arn        = var.certificate_arn
}
