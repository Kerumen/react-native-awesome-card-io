import React, { Component } from 'react';
import { StyleSheet } from 'react-native';

class CardIOView extends Component {
  render() {
    return (
      <View style={styles.container}>
        <Text style={styles.text}>
          CardIOView is not supported on this platform!
        </Text>
      </View>
    );
  }
}


var styles = StyleSheet.create({
  container: {
    width: 120,
    height: 20,
    backgroundColor: '#ffbcbc',
    borderWidth: 1,
    borderColor: 'red',
    alignItems: 'center',
    justifyContent: 'center',
  },
  text: {
    color: '#333333',
    margin: 5,
    fontSize: 10,
  }
});

export default CardIOView;
