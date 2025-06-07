import { StyleSheet, View } from 'react-native';
//page should be about settigns
// baiscally just themes for now
import llmInit from '@/components/GeminiInit'; // Adjust the import path as necessary
import { useState } from 'react';


export default function Tab() {
  const [apiKey, setApiKey] = useState(''); 

  const handleApiKeyChange = (text: { target: { value: React.SetStateAction<string>; }; }) => {
    setApiKey(text.target.value);
  };
  
  return (
    <View style={styles.container}>
      <input
        type="text"
        value={apiKey}
        onChange={handleApiKeyChange}
        placeholder="Enter your API Key" 
      />
      <div className='col-auto' style={{ marginTop: '10px' }}>
        <button
          className='btn btn-primary'
          onClick={() => {
            llmInit(apiKey); // Initialize the LLM with the API key
            console.log('API Key submitted:', apiKey);
             
         }}>
            Submit
        </button>
      </div>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
  },
});
