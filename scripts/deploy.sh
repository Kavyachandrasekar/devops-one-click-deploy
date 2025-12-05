#!/bin/bash
set -e

echo "🚀 Starting Deployment..."

# Navigate to Terraform folder inside repo
cd terraform

echo "📌 Initializing Terraform..."
terraform init -input=false

echo "📌 Applying Terraform..."
terraform apply -auto-approve -var-file="terraform.tfvars"

echo "✅ Deployment Complete!"
