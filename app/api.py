from fastapi import FastAPI
from pydantic import BaseModel
import openai
import os
from dotenv import load_dotenv

load_dotenv()
openai.api_key = os.getenv("OPENAI_API_KEY")

app = FastAPI()

class Prompt(BaseModel):
    message: str

@app.post("/chat")
async def chat(prompt: Prompt):
    response = openai.ChatCompletion.create(
        model="gpt-4",
        messages=[{"role": "user", "content": prompt.message}]
    )
    return {"response": response.choices[0].message.content}