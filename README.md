# Layer 7 Security Terraform + Jenkins v2

This version removes invalid single-line Terraform blocks and semicolon-style syntax.

## Provisioned architecture

Internet -> Shield Advanced placeholder -> CloudFront -> AWS WAF -> Cognito -> ALB/Ingress -> EKS -> App

Telemetry -> CloudWatch/CloudTrail/VPC Flow Logs/GuardDuty -> Kinesis -> S3 Data Lake -> Glue Crawler/Catalog -> Athena

## Run

```bash
cd terraform/envs/dev
cp terraform.tfvars.example terraform.tfvars
# edit terraform.tfvars
terraform init
terraform validate
terraform plan
terraform apply -auto-approve
```
