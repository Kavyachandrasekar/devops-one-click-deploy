#!/bin/bash
set -e

echo "🚀 Starting Deployment..."

# Go to Terraform folder
cd "$CI_PROJECT_DIR/terraform"

echo "📌 Initializing Terraform..."
terraform init -input=false

echo "📌 Planning Terraform..."
terraform plan -out=tfplan -var-file="terraform.tfvars"

echo "📌 Applying Terraform..."
terraform apply -input=false tfplan

echo "✅ Deployment complete!"

# Optional: show ALB DNS
echo "🔍 Fetching ALB DNS output..."
terraform output alb_dns_name
