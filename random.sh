# This was meant to generate an MCP server - but the shell script is in the wrong shape, so it is just generating random output.

for i in {1..100}; do echo "You are a tool creator, create a python script using FastMCP which exposes four tools: cerebras_qwen, openrouter_qwen, cerebras_scout, openrouter_scout.

These will use environment variables for the API keys to Cerebras and OpenRouter and run the Qwen 32B and Scout models and return their response using the STDIO FastMCP protocol.

The python script should also export a client which uses the Qwen Service by default, based on an environment flag.

" | ./bra.sh > data/res-$i.json; done;
