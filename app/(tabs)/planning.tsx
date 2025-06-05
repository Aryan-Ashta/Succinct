import { GoogleGenAI } from "@google/genai";
import React, { useState } from 'react';

function Planning() {
  const [input, setInput] = useState('');
  const [promptResponses, setPromptResponses] = useState<string[]>([]);
  const[loading, setLoading] = useState(false);
  const genAI = new GoogleGenAI ({
    apiKey: process.env.GOOGLE_API_KEY,
})
  const handleInputChange = (text: { target: { value: React.SetStateAction<string>; }; }) => {
    setInput(text.target.value);
  };
  const response = async() => {
    try{
      setLoading(true);
      const result = await genAI.models.generateContent({
        model: "gemini-2.0-flash",
        contents: input
      });
      setInput('');
      const text = result.text ?? '';
      console.log(text);
      setPromptResponses([...promptResponses, text]);
      setLoading(false);
    }
    catch(error){
      console.log(error);
      console.log("Error generating response");
      setLoading(false);
    }
  };
  return(
<div className="container">
    <div className="row">
      <div className="col">
        <input
          type="text"
          value={input}
          onChange={handleInputChange}
          placeholder="Ask Me Something You Want"
          className="form-control"
        />
      </div>
      <div className="col-auto">
        <button onClick={response} className="btn btn-primary">Send</button>
      </div>
    </div>
    {loading ? (
      <div className="text-center mt-3">
        <div className="spinner-border text-primary" role="status">
          <span className="visually-hidden">Loading...</span>
       // This message is shown while your answer to your prompt is being generated
        </div>
      </div>
    ) : (
      promptResponses.map((promptResponse, index) => (
        <div key={index} >
          <div className={`response-text ${index === promptResponses.length - 1 ? 'fw-bold' : ''}`}>{promptResponse}</div>
     //the latest response shown in bold letters
        </div>
      ))
    )}
  </div>



  );

}

export default Planning;