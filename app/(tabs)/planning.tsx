
import { storage } from '@/mmkv'; // Assuming you have a MMKV storage setup
import { GoogleGenAI } from '@google/genai';
import React, { useState } from 'react';

/*const messages = [
  {
    role: "model",
    content: ""
  },
  {
    role: "user",
    content: ""
  }
];*/


const planProject = async (prompt: string, deadline: string, taskName: string) => {
  const start = "How do I ";
  const fullPrompt = start.concat(
    prompt,
    "? It needs to be completed by ",
    deadline,
    " (mm/dd/yyyy format) and the task name is ",
    taskName
  );
  var plan = "";
  const apiKey = storage.getString('apiKey');

  const genAI = new GoogleGenAI({
    apiKey: apiKey,
  });
  const response = await genAI.models.generateContentStream({
    model: "gemini-2.5-flash-preview-05-20",
    contents: fullPrompt,
    config: {
      maxOutputTokens: 1500,
      temperature: 1.2,
      systemInstruction: "You are a helpful assistant that helps users plan tasks and projects. You give defined dates and times for each task that needs to be done to achieve the project goal.",
    }
  })

  for await (const chunk of response) {
    console.log("Chunk received:", chunk.text);
    if (chunk.text) {
      plan += chunk.text;

    } return plan;
  }
  /*const updatedMessages = [
    ...messages,
    { role: "user", content: fullPrompt }
  ];

  const chat = await genAI.chats.create({
    model: "gemini-2.5-flash-preview-05-20",
    config: {
      systemInstruction: "You are a helpful assistant that helps users plan tasks and projects.  You give defined dates and times for each task what needs to be done to achieve the project goal.",
      maxOutputTokens: 1500,
      temperature: 1.2,
    },
    history: updatedMessages
  });

  const response = await chat.sendMessage({
    message: fullPrompt
  });
  if (response.text) {
  updatedMessages.push({ role: "model", content: response.text });
  }
  console.log("Response from Gemini:", response.text);*/
};


function Planning() {
  
  

  const [prompt, setPrompt] = useState('');
  const [deadline, setDeadline] = useState('');
  const [taskName, setTaskName] = useState('');
  
  const handlePromptChange = (text: { target: { value: React.SetStateAction<string>; }; }) => {
    setPrompt(text.target.value);
  };
  const handleDeadlineChange = (text: { target: { value: React.SetStateAction<string>; }; }) => {
    setDeadline(text.target.value);
  };
  const handleTaskNameChange = (text: { target: { value: React.SetStateAction<string>; }; }) => {
    setTaskName(text.target.value);
  };
  

  return (
    <div className="container">
      <div className='row'>
        <div className='col'>
          <h1 className='text-center'>Planning</h1>
          <p className='text-center'>Plan your projects and tasks with AI assistance.</p>
            <input
              type="text"
              value={prompt}
              onChange={handlePromptChange}
              placeholder="How do I...?"
              className="form-control"
            />
            <input
              type="text"
              value={deadline}
              onChange={handleDeadlineChange}
              placeholder="Deadline (mm/dd/yyyy)"
              className="form-control"
            />
            <input
              type="text"
              value={taskName}
              onChange={handleTaskNameChange}
              placeholder="Task Name"
              className="form-control"
            />
            <div className="col-auto">
              <button onClick={() => {planProject(prompt, deadline, taskName)}} className="btn btn-primary">Send</button>
            </div>
           
        </div>
      </div>
    </div>
  );
}
export default Planning;
