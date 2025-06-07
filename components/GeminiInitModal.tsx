import { PropsWithChildren, useState } from 'react';
import { Modal, Pressable, Text, TextInput, View } from 'react-native';
import llmInit from './GeminiInit';

type Props = PropsWithChildren<{
  isVisible: boolean;
  onClose: () => void;
  onApiKeySubmit: (apiKey: string) => void;
}>;


  
export default function GeminiInitModal({ isVisible, onClose, onApiKeySubmit }: Props) {
    const [apiKey, setApiKey] = useState('');
    return(
        <View>
            <Modal
                animationType='slide'
                transparent={true}
                visible={isVisible}
                onRequestClose={onClose}
            >
                <View>
                    <View>
                        
                        <TextInput
                            value={apiKey}
                            onChangeText={setApiKey}
                            placeholder="API Key"
                        />
                        <Pressable
                            onPress={() => {
                                const genAI = llmInit(apiKey);
                                onApiKeySubmit(apiKey);
                                onClose();
                            }}
                        >
                            <Text >Submit</Text>
                        </Pressable>
                    </View>
                </View>
            </Modal>
        </View>
    )
}