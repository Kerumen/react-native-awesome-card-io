import { NativeModules } from 'react-native'

const RNCardIOModule = NativeModules.CardIOModule

const CardIOModule = {
  scanCard(config = {}) {
    return RNCardIOModule.scanCard(config)
  },
}

export default CardIOModule
