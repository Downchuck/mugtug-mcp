#!/bin/bash

# Shell script to interact with Cerebras Qwen 3 via OpenRouter
# Requires OPENROUTER_API_KEY environment variable

read -r -d '' INPUT <<'EOF'
EOF

API_KEY="$OPENROUTER_API_KEY"
MODEL="cerebras/qwen-3-32b"

curl -s -X POST "https://openrouter.ai/api/v1/models/$MODEL:generate" \
  -H "Authorization: Bearer $API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "prompt": "'"$(echo "$INPUT" | sed 's/"/\\"/g')"'",
    "max_tokens": 512
  }' | jq -r .response
