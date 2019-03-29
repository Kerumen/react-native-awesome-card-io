import React, { Component } from 'react'
import { StyleSheet, View, TouchableOpacity, Text } from 'react-native'
import { CardIOModule } from 'react-native-awesome-card-io'

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: '#F5FCFF',
  },
})

export default class App extends Component {
  scanCard = async () => {
    try {
      const card = await CardIOModule.scanCard()
      console.log(card)
    } catch (err) {
      console.log(err)
    }
  }

  render() {
    return (
      <View style={styles.container}>
        <TouchableOpacity onPress={this.scanCard}>
          <Text>Scan card!</Text>
        </TouchableOpacity>
      </View>
    )
  }
}
