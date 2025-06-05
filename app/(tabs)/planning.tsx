import { GoogleGenAI } from "@google/genai";
import React, { useState } from 'react';
import { ScrollView } from 'react-native';
import Markdown from 'react-native-markdown-display';


/*
break current planning function into smaller components
one function for initializing the ai 
one function for calling gemini
another for using the modal to collect api key and ui
*/
function Planning() {
  
  const [input, setInput] = useState('');
  const [deadline, setDeadline] = useState('');
  const [taskName, setTaskName] = useState('');
  const [apiKey, setApiKey] = useState('');

  const [promptResponses, setPromptResponses] = useState<string[]>([]);
  const[loading, setLoading] = useState(false);

  const handleInputChange = (text: { target: { value: React.SetStateAction<string>; }; }) => {
    setInput(text.target.value);
  };
  const handleDeadlineChange = (text: { target: { value: React.SetStateAction<string>; }; }) => {
    setDeadline(text.target.value);
  };
  const handleTaskNameChange = (text: { target: { value: React.SetStateAction<string>; }; }) => {
    setTaskName(text.target.value);
  };
  const handleApiKeyChange = (text: { target: { value: React.SetStateAction<string>; }; }) => {
    setApiKey(text.target.value);
  };
  
 
  const genAI = new GoogleGenAI ({
        apiKey: apiKey, 

      })
    
  
  const response = async() => {
    try{
      setLoading(true);
      
      setApiKey('');
      const result = await genAI.models.generateContent({
        model: "gemini-2.5-flash-preview-05-20",
        contents: input.concat("It needs to be completed by ", deadline, " and the task name is ", taskName),
      });
      setInput('');
      setDeadline('');
      setTaskName('');
      
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
  <ScrollView style={{ flex: 1, padding: 20, backgroundColor: 'fdfdfd' }} contentContainerStyle={{ flexGrow: 1 }}>
<div className="container">
    <div className="row">
      <div className="col">
        <input
          type="text"
          value={apiKey}
          onChange={handleApiKeyChange}
          placeholder="Enter your API Key"
          className="form-control"
        />    
        <input
          type="text"
          value={input}
          onChange={handleInputChange}
          placeholder="Ask Me Something You Want"
          className="form-control"
        />
        <input
          type="text"
          value={deadline}
          onChange={handleDeadlineChange}
          placeholder="Deadline (e.g., 2023-12-31)"
          className="form-control"
        />
        <input
          type="text"
          value={taskName}
          onChange={handleTaskNameChange}
          placeholder="Task Name"
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
        </div>
      </div>
    ) : (
      promptResponses.map((promptResponse, index) => (
        <div key={index} >
          <div className={`response-text ${index === promptResponses.length - 1 ? 'fw-bold' : ''}`}>
            <Markdown
            style={{
                body: {color: 'black', fontSize: 16},
                heading1: {color: 'green'},
                heading2: {color: 'green'},
                code_block: {color: 'black', fontSize: 14}
              }}
            >
              {promptResponse}
            </Markdown>
            </div>
        </div>
      ))
    )}
  </div>
</ScrollView>


  );

}

export default Planning;