import { StyleSheet, View } from 'react-native';
//page should be about settigns
// baiscally just themes for now
import { storage } from '@/mmkv';
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
            storage.set('apiKey', apiKey);
            console.log("API Key saved");
         }}>
            Submit
        </button>
        
      </div>
    </View>
  );
}


const styles = StyleSheet.create({
  container: {
    flex: 3,
    justifyContent: 'center',
    alignItems: 'center',
  },
});
