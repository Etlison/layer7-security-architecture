#!/usr/bin/env bash
set -euo pipefail

CLUSTER_NAME="${CLUSTER_NAME:-layer7-security-dev-eks}"
AWS_REGION="${AWS_REGION:-us-east-1}"

helm repo add eks https://aws.github.io/eks-charts || true
helm repo update

helm upgrade --install aws-load-balancer-controller eks/aws-load-balancer-controller   -n kube-system   --set clusterName="$CLUSTER_NAME"   --set region="$AWS_REGION"
