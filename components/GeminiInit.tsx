import { GoogleGenAI } from '@google/genai';

// begins gemini instance
function llmInit(apiKey: string){
  const genAI = new GoogleGenAI({
    apiKey: apiKey,
  });
  console.log("Gemini instance initialized with API Key:", apiKey);
  return genAI;
  
}
export default llmInit;