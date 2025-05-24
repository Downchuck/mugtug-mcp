# mugtug-mcp

## System Prompt:
You are a software developer entering a hackathon with a simple program that serves as a demonstration of creating tools using the Cerebras Cloud service. You are using Seed: 0.

For OpenRouter, the model ID for Qwen is "qwen/qwen3-32b" and for Scout it is "meta-llama/llama-4-scout".
For Cerebras Cloud API: The model ID for Scout is "llama-4-scout-17b-16e-instruct" and for Qwen it is "qwen-3-32b".
For Scout, the max completion tokens should be 8192; for Qwen, the max is 16382.

Keep responses concise without explaining how to use the code. 


## Query:
Create a shell script that expects an API key to OpenRouter and uses the Cerebras Qwen 3 model.

It should accept stdin input and return a response.

Have the shell script pipe into the "sh" command using the HEREDOC syntax, with EOF as the heredoc word.


Run the following input into the shell script, as "CONTEXT" using markdown syntax:

```
​​We are excited to present the Cerebras and OpenRouter Qwen 3 Hackathon! You'll have a 9-hour window to build something amazing (and fast) with exclusive access to Qwen 3 32B on Cerebras!

​​​The hackathon will take place in the Cerebras Discord Server.

​​​⏰ Timeline

​​​• Start: May 24th, 8:00 am PT

​​​• End: May 24th, 5:00 pm PT

​​​Competition Details:
Build AI applications that leverage Cerebras's processing speed + OpenRouter's platform to solve a cool problem with the amazing new Qwen 3 model!

​​​❗5 Projects each win a $100 Gift Card 🏆❗

​​​🔑 How to get started with Cerebras

​​​1. Go to cloud.cerebras.ai

​​​2. Create an account to get instant access to our API

​​​3. Check out the Cerebras Quickstart

​4. Check out how to use Cerebras on OpenRouter!

​​​📤 Submission Instructions

​​​1. Share in the Discord #showcase channel:

​​​   1. Project repository/link

​​​   2. Brief description

​​​   3. Demo video

​​​2. Tag with #CerebrasQwenHackathon or #OpenRouterQwenHackathon

​​​3. You can submit as many times as you want. For each submission, make a separate post.

​​​4. (Bonus points if you post and tag us on socials - @CerebrasSystems and @OpenRouterAI on X, so we can host more events like this!)

​5. No prebuilt projects! To keep everything fair, we will be prioritizing submissions built during the event.
```

Include with separation "======" the next section:

You are a tool creator, create a python script using FastMCP which exposes four tools: cerebras_qwen, openrouter_qwen, cerebras_scout, openrouter_scout.

These will use environment variables for the API keys to Cerebras and OpenRouter and run the Qwen 32B and Scout models and return their response using the STDIO FastMCP protocol.

The python script should also export a client which uses the Qwen Service by default, based on an environment flag.
