import { View, Text, StyleSheet } from 'react-native';
//here use ai to help break down the events
//input shoudl be the task and return should be the breakdown of the task
//should automatically add the task to the calendar
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
