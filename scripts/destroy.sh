#!/bin/bash
set -e

echo "💣 Destroying Terraform resources..."

cd terraform

if [ ! -f terraform.tfstate ]; then
  echo "❌ No Terraform state found! Nothing to destroy."
  exit 1
fi

echo "📌 Initializing Terraform..."
terraform init -input=false

echo "📌 Destroying Terraform resources..."
terraform destroy -auto-approve -var-file="terraform.tfvars"

echo "✅ Resources destroyed!"
