from llama_cpp import Llama
import json
import sys

def load_llama():
      llm = Llama(
            model_path="../Meta-Llama-3-8B-Instruct/Meta-Llama-3-8B-Instruct.Q8_0.gguf",
            logits_all=True,
            verbose=False,
            n_gpu_layers=-1, # Uncomment to use GPU acceleration
            n_ctx=2048, # Uncomment to increase the context window
      )

      llm.set_seed(1000)
      return llm

def llama_call(llm, prompt, temperature):
      
      output = llm(
                  prompt, # Prompt
                  max_tokens=300, # Generate up to 300 tokens, set to None to generate up to the end of the context window
                #   stop=["STOP"], # Stop generating just before the model would generate a new question
                  echo=False, # Echo the prompt back in the output
                  logprobs=50,
                  top_k=50,
                  temperature=temperature,
            ) # Generate a completion, can also call create_completion
      
      return output

preamble = "You are an experienced searcher. Please reformulate the following query in 10 different ways so that the reformulated query has a similar (either more specific or more generic) information need."
query = "where is the show shameless filmed"
prompt = f'{preamble}\nQuery:"{query}"'