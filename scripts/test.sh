#!/bin/bash
set -e

echo "🧪 Running API Tests..."

# Get ALB DNS from Terraform output
cd terraform
ALB_URL=$(terraform output -raw alb_dns_name)

echo "➡️ GET /"
curl -s http://$ALB_URL/

echo ""
echo "➡️ GET /health"
curl -s http://$ALB_URL/health

echo ""
echo "✅ API Test Completed!"
