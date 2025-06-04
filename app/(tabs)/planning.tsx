{/*import { View, Text, StyleSheet } from 'react-native';
//here use ai to help break down the events
//input shoudl be the task and return should be the breakdown of the task
//should automatically add the task to the calendar

import { HumanMessage, SystemMessage } from "@langchain/core/messages";

import { ChatGoogleGenerativeAI } from "@langchain/google-genai";

const llm = new ChatGoogleGenerativeAI({
  model: "gemini-2.0-flash",
  temperature: 0
});


const messages = [
  new SystemMessage("Translate the following from English into Italian"),
  new HumanMessage("hi!"),
];



export default async function Planning() {
    const response = await llm.invoke(messages);
    console.log(response.content);
  
    return (
    <View style={styles.container}>
      <Text></Text>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
  },
}); */}
import { GoogleGenAI } from "@google/genai";
import React, { useState } from 'react';
import { Text, TextInput, View } from 'react-native';

const Planner = () => {
  const [text, setText] = useState('');
  async function AI() {
    const key = process.env.GOOGLE_API_KEY;
    const genai = new GoogleGenAI({
      apiKey: key,
    });
    return (
      <View style={{ padding: 10 }}>
        <TextInput
          style={{ height: 40, borderColor: 'gray', borderWidth: 1 }}
          placeholder="Enter your task"
          value={text}
          onChangeText={setText}
        />
        <Text style={{ marginTop: 10 }}>
          {text}
        </Text>
      </View>
    );
  }
};

export default Planner;

