#!/bin/bash
set -e

echo "💣 Destroying Terraform resources..."

cd terraform

echo "📌 Initializing Terraform..."
terraform init -input=false

echo "📌 Destroying Terraform resources..."
terraform destroy -auto-approve -var-file="terraform.tfvars"

echo "✅ Resources destroyed!"
