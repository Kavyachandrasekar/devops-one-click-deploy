#!/bin/bash

URL=$1

echo "🧪 Running API Tests..."
echo "➡️ Testing: $URL"

CODE=$(curl -s -o /dev/null -w "%{http_code}" "http://$URL")

if [[ "$CODE" -eq 200 ]]; then
  echo "✅ API Test Passed"
else
  echo "❌ Failed! Expected 200 but got $CODE"
  exit 3
fi
