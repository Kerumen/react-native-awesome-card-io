import React, { Component, PropTypes } from 'react';
import { requireNativeComponent, NativeAppEventEmitter, NativeModules } from 'react-native';

const { CardIOUtilities } = NativeModules;

class CardIOView extends Component {
  static propTypes = {
    didScanCard: PropTypes.func.isRequired,
    languageOrLocale: PropTypes.string,
    guideColor: PropTypes.string,
    useCardIOLogo: PropTypes.bool,
    hideCardIOLogo: PropTypes.bool,
    allowFreelyRotatingCardGuide: PropTypes.bool,
    scanInstructions: PropTypes.string,
    scanOverlayView: PropTypes.element,
    scanExpiry: PropTypes.bool,
    scannedImageDuration: PropTypes.number,
    detectionMode: PropTypes.oneOf([
      CardIOUtilities.DETECTION_MODE.AUTOMATIC,
      CardIOUtilities.DETECTION_MODE.IMAGE_AND_NUMBER,
      CardIOUtilities.DETECTION_MODE.IMAGE,
    ]),
  };

  componentWillMount() {
    this.listener = NativeAppEventEmitter.addListener('didScanCard', this.props.didScanCard);
  }

  componentWillUnmount() {
    if (this.listener) {
      this.listener.remove();
    }
  }

  render() {
    return <RCTCardIOView {...this.props} />;
  }
}

const RCTCardIOView = requireNativeComponent('RCTCardIOView', CardIOView);

export default CardIOView;
