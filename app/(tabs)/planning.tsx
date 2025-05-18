import { View, Text, StyleSheet } from 'react-native';

export default function Planning() {
  return (
    <View style={styles.container}>
      <Text>Tab [Planning]</Text>
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
