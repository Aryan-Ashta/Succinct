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
import { View, Text, StyleSheet } from 'react-native';
import { GoogleGenAI } from "@google/genai";

const ai = new GoogleGenAI({ apiKey: "goog api key" });

async function main() {
  const response = await ai.models.generateContent({
    model: "gemini-2.0-flash",
    contents: "Explain how AI works in a few words",
  });
  return(response.text);
}

export default function aiView(){
    
        <View>
            <Text>{main()}</Text>
        </View>
    return
}
const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
  },
});