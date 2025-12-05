#!/bin/bash
set -e

echo "💣 Destroying Terraform resources..."

cd "$CI_PROJECT_DIR/terraform"

echo "📌 Initializing Terraform..."
terraform init -input=false

echo "📌 Destroying..."
terraform destroy -auto-approve -var-file="terraform.tfvars"

echo "✅ Resources destroyed!"
