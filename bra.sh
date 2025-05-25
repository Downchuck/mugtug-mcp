#!/bin/bash

# set -euo pipefail
JSON_PROMPT=$(cat | jq -M --raw-input --slurp .)

API_KEY="${API_KEY:-$OPENROUTER_API_KEY}"
MODEL="${MODEL:-cerebras/qwen-3-32b}"

# echo "DEBUG $OPENROUTER_API_KEY - $MODEL"
read -r -d '' JSON_CONTEXT <<'MARKDOWN'
You are a software developer entering a hackathon with a simple program that serves as a demonstration of creating tools using the Cerebras Cloud service. You are using Seed: 0.

For OpenRouter, the model ID for Qwen is "qwen/qwen3-32b" and for Scout it is "meta-llama/llama-4-scout".
For Cerebras Cloud API: The model ID for Scout is "llama-4-scout-17b-16e-instruct" and for Qwen it is "qwen-3-32b".
For Scout, the max completion tokens should be 8192; for Qwen, the max is 16382.

Keep responses concise without explaining how to use the code.

Sections of context are separated by the markdown string "---"

Think through everything.

---

We are excited to present the Cerebras and OpenRouter Qwen 3 Hackathon! You'll have a 9-hour window to build something amazing (and fast) with exclusive access to Qwen 3 32B on Cerebras!

The hackathon will take place in the Cerebras Discord Server.

⏰ Timeline

• Start: May 24th, 8:00 am PT

• End: May 24th, 5:00 pm PT

Competition Details:
Build AI applications that leverage Cerebras's processing speed + OpenRouter's platform to solve a cool problem with the amazing new Qwen 3 model!

❗5 Projects each win a $100 Gift Card 🏆❗

🔑 How to get started with Cerebras

1. Go to cloud.cerebras.ai

2. Create an account to get instant access to our API

3. Check out the Cerebras Quickstart

4. Check out how to use Cerebras on OpenRouter!

📤 Submission Instructions

1. Share in the Discord #showcase channel:

   1. Project repository/link

   2. Brief description

   3. Demo video

2. Tag with #CerebrasQwenHackathon or #OpenRouterQwenHackathon

3. You can submit as many times as you want. For each submission, make a separate post.

4. (Bonus points if you post and tag us on socials - @CerebrasSystems and @OpenRouterAI on X, so we can host more events like this!)

5. No prebuilt projects! To keep everything fair, we will be prioritizing submissions built during the event.
MARKDOWN

JSON_CONTEXT=$(echo "$JSON_CONTEXT" | jq -M --raw-input --slurp .)

HTTP_POST=$(cat << E
  -d '{
    "model": "qwen/qwen3-32b",
    "provider": {
      "order": ["cerebras"],
      "allow_fallbacks": false
    },
    "messages": [
      {
        "role": "system",
        "content": $JSON_CONTEXT
      },
      {
        "role": "user",
        "content": $JSON_PROMPT
      }
    ],
    "temperature": 0.7,
    "max_tokens": 16382
  }' | jq -r '.choices[0].message.content'
E
)

if true; then
curl -s "https://openrouter.ai/api/v1/chat/completions" \
  -H "Authorization: Bearer $API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "model": "qwen/qwen3-32b",
    "provider": {
      "order": ["cerebras"],
      "allow_fallbacks": false
    },
    "messages": [
      {
        "role": "system",
        "content": $JSON_CONTEXT
      },
      {
        "role": "user",
        "content": $JSON_PROMPT
      }
    ],
    "temperature": 0.7,
    "max_tokens": 16382
  }'
# | jq -r '.choices[0].message.content'
fi;

# echo "$HTTP_POST"
