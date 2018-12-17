# [react-native-awesome-card-io](https://kerumen.github.io/react-native-awesome-card-io/)
A complete and **cross-platform** [card.io](https://www.card.io/) component for React Native.

## Getting started

```bash
$ npm install react-native-awesome-card-io --save
$ react-native link react-native-awesome-card-io
```

## Usage

This component provides an abstraction of the card.io entry points for iOS and Android.

| Javascript     | iOS                                                                                             | Android                                                                                              | Description                                                                         |
|----------------|-------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------|
| `CardIOModule` | [`CardIOPaymentViewController`](https://github.com/card-io/card.io-iOS-SDK#integrate-as-a-view) | [`CardIOActivity`](http://card-io.github.io/card.io-Android-SDK/io/card/payment/CardIOActivity.html) | A module to launch the card.io view controller which handles everything.            |
| `CardIOView`   | [`CardIOView`](https://github.com/card-io/card.io-iOS-SDK#integrate-as-a-view-controller)       | N / A                                                                                                | Create a `CardIOView` to do card scanning only and manage everything else yourself. |

### `CardIOView`

*This component is iOS-only as the card.io Android SDK does not offer this functionality.*

```jsx
import React, { Component } from 'react';
import { View } from 'react-native';
import { CardIOView, CardIOUtilities } from 'react-native-awesome-card-io';

class CardIOExample extends Component {

  componentWillMount() {
    CardIOUtilities.preload();
  }

  didScanCard = (card) => {
    // the scanned card
  }

  render() {
    return (
      <View>
        <CardIOView
          didScanCard={this.didScanCard}
          style={{ flex: 1 }}
        />
      </View>
    );
  }
}
```

#### Props

`didScanCard` *function* **Required** - This function will be called when the CardIOView completes its work and returns a [CreditCard](#creditcard). ([Docs](https://github.com/card-io/card.io-iOS-SDK/blob/ec9a8632c9fd879537354d4b9075aa487dcebe8b/CardIO/CardIOViewDelegate.h#L24))

`languageOrLocale` *string* - The preferred language for all strings appearing in the user interface. ([Docs](https://github.com/card-io/card.io-iOS-SDK/blob/ec9a8632c9fd879537354d4b9075aa487dcebe8b/CardIO/CardIOView.h#L38))

`guideColor` *string* - Alter the card guide (bracket) color. Opaque colors recommended. ([Docs](https://github.com/card-io/card.io-iOS-SDK/blob/ec9a8632c9fd879537354d4b9075aa487dcebe8b/CardIO/CardIOView.h#L42))

`useCardIOLogo` *boolean* `false` - Set to `true` to show the card.io logo over the camera instead of the PayPal logo. ([Docs](https://github.com/card-io/card.io-iOS-SDK/blob/ec9a8632c9fd879537354d4b9075aa487dcebe8b/CardIO/CardIOView.h#L45))

`hideCardIOLogo` *boolean* `false` - Hide the PayPal or card.io logo in the scan view. ([Docs](https://github.com/card-io/card.io-iOS-SDK/blob/ec9a8632c9fd879537354d4b9075aa487dcebe8b/CardIO/CardIOView.h#L48))

`allowFreelyRotatingCardGuide` *boolean* `true` - By default, in camera view the card guide and the buttons always rotate to match the device's orientation. ([Docs](https://github.com/card-io/card.io-iOS-SDK/blob/ec9a8632c9fd879537354d4b9075aa487dcebe8b/CardIO/CardIOView.h#L55))

`scanInstructions` *string* - Set the scan instruction text. ([Docs](https://github.com/card-io/card.io-iOS-SDK/blob/ec9a8632c9fd879537354d4b9075aa487dcebe8b/CardIO/CardIOView.h#L59))

`scanExpiry` *string* `true` - Set to `false` if you don't want the camera to try to scan the card expiration. ([Docs](https://github.com/card-io/card.io-iOS-SDK/blob/ec9a8632c9fd879537354d4b9075aa487dcebe8b/CardIO/CardIOView.h#L79))

`scannedImageDuration` *number* `1.0` - How long the CardIOView will display an image of the card with the computed card number superimposed after a successful scan. ([Docs](https://github.com/card-io/card.io-iOS-SDK/blob/ec9a8632c9fd879537354d4b9075aa487dcebe8b/CardIO/CardIOView.h#L97))

`detectionMode` *[CardIODetectionMode](#constants)* `CardIODetectionModeCardImageAndNumber` - Set the detection mode. ([Docs](https://github.com/card-io/card.io-iOS-SDK/blob/ec9a8632c9fd879537354d4b9075aa487dcebe8b/CardIO/CardIOView.h#L90))

### `CardIOModule`

*This module abstracts the [`CardIOPaymentViewController`](https://github.com/card-io/card.io-iOS-SDK#integrate-as-a-view) on iOS and the [`CardIOActivity`](http://card-io.github.io/card.io-Android-SDK/io/card/payment/CardIOActivity.html) on Android.*

```jsx
import React, { Component } from 'react';
import { View, TouchableOpacity, Text, Platform } from 'react-native';
import { CardIOModule, CardIOUtilities } from 'react-native-awesome-card-io';

class CardIOExample extends Component {

  componentWillMount() {
    if (Platform.OS === 'ios') {
      CardIOUtilities.preload();
    }
  }

  scanCard() {
    CardIOModule
      .scanCard()
      .then(card => {
        // the scanned card
      })
      .catch(() => {
        // the user cancelled
      })
  }

  render() {
    return (
      <View>
        <TouchableOpacity onPress={this.scanCard.bind(this)}>
          <Text>Scan card!</Text>
        </TouchableOpacity>
      </View>
    );
  }
}
```

#### Methods

`scanCard([config])` -> Promise - Launch the card.io controller to manage the card scanning and get the [CreditCard](#creditcard) result in the resolved promise.

 - `config` On object with the following available keys:
   - `languageOrLocale` *string* - The preferred language for all strings appearing in the user interface. ([iOS](https://github.com/card-io/card.io-iOS-SDK/blob/ec9a8632c9fd879537354d4b9075aa487dcebe8b/CardIO/CardIOPaymentViewController.h#L43) / [Android](http://card-io.github.io/card.io-Android-SDK/io/card/payment/CardIOActivity.html#EXTRA_LANGUAGE_OR_LOCALE))
   - `guideColor` *string* - Alter the card guide (bracket) color. Opaque colors recommended. ([iOS](https://github.com/card-io/card.io-iOS-SDK/blob/ec9a8632c9fd879537354d4b9075aa487dcebe8b/CardIO/CardIOPaymentViewController.h#L70) / [Android](http://card-io.github.io/card.io-Android-SDK/io/card/payment/CardIOActivity.html#EXTRA_GUIDE_COLOR))
   - `useCardIOLogo` *boolean* `false` - Set to `true` to show the card.io logo over the camera view instead of the PayPal logo. ([iOS](https://github.com/card-io/card.io-iOS-SDK/blob/ec9a8632c9fd879537354d4b9075aa487dcebe8b/CardIO/CardIOPaymentViewController.h#L148) / [Android](http://card-io.github.io/card.io-Android-SDK/io/card/payment/CardIOActivity.html#EXTRA_USE_CARDIO_LOGO))
   - `hideCardIOLogo` *boolean* `false` - Hide the PayPal or card.io logo in the scan view. ([iOS](https://github.com/card-io/card.io-iOS-SDK/blob/ec9a8632c9fd879537354d4b9075aa487dcebe8b/CardIO/CardIOPaymentViewController.h#L96) / [Android](http://card-io.github.io/card.io-Android-SDK/io/card/payment/CardIOActivity.html#EXTRA_HIDE_CARDIO_LOGO))
   - `scanInstructions` *string* - Set the scan instruction text. If nil, use the default text. ([iOS](https://github.com/card-io/card.io-iOS-SDK/blob/ec9a8632c9fd879537354d4b9075aa487dcebe8b/CardIO/CardIOPaymentViewController.h#L93) / [Android](http://card-io.github.io/card.io-Android-SDK/io/card/payment/CardIOActivity.html#EXTRA_SCAN_INSTRUCTIONS))
   - `suppressManualEntry` *boolean* `false` - Set to `true` to prevent card.io from showing its "Enter Manually" button. ([iOS](https://github.com/card-io/card.io-iOS-SDK/blob/ec9a8632c9fd879537354d4b9075aa487dcebe8b/CardIO/CardIOPaymentViewController.h#L163) / [Android](http://card-io.github.io/card.io-Android-SDK/io/card/payment/CardIOActivity.html#EXTRA_SUPPRESS_MANUAL_ENTRY))
   - `suppressConfirmation` *boolean* `false` - If `true`, don't have the user confirm the scanned card, just return the results immediately. ([iOS](https://github.com/card-io/card.io-iOS-SDK/blob/ec9a8632c9fd879537354d4b9075aa487dcebe8b/CardIO/CardIOPaymentViewController.h#L74) / [Android](http://card-io.github.io/card.io-Android-SDK/io/card/payment/CardIOActivity.html#EXTRA_SUPPRESS_CONFIRMATION))
   - `requireExpiry` *boolean* `true` - Set to `false` if you don't need to collect the card expiration. ([iOS](https://github.com/card-io/card.io-iOS-SDK/blob/ec9a8632c9fd879537354d4b9075aa487dcebe8b/CardIO/CardIOPaymentViewController.h#L126) / [Android](http://card-io.github.io/card.io-Android-SDK/io/card/payment/CardIOActivity.html#EXTRA_REQUIRE_EXPIRY))
   - `requireCVV` *boolean* `true` - Set to `false` if you don't need to collect the CVV from the user. ([iOS](https://github.com/card-io/card.io-iOS-SDK/blob/ec9a8632c9fd879537354d4b9075aa487dcebe8b/CardIO/CardIOPaymentViewController.h#L129) / [Android](http://card-io.github.io/card.io-Android-SDK/io/card/payment/CardIOActivity.html#EXTRA_REQUIRE_CVV))
   - `requirePostalCode` *boolean* `false` - Set to `false` if you need to collect the billing postal code. ([iOS](https://github.com/card-io/card.io-iOS-SDK/blob/ec9a8632c9fd879537354d4b9075aa487dcebe8b/CardIO/CardIOPaymentViewController.h#L132) / [Android](http://card-io.github.io/card.io-Android-SDK/io/card/payment/CardIOActivity.html#EXTRA_REQUIRE_POSTAL_CODE))
   - `restrictPostalCodeToNumericOnly` *boolean* `false` - Set to `true` if the postal code should only collect numeric input. ([iOS](https://github.com/card-io/card.io-iOS-SDK/blob/ec9a8632c9fd879537354d4b9075aa487dcebe8b/CardIO/CardIOPaymentViewController.h#L137) / [Android](http://card-io.github.io/card.io-Android-SDK/io/card/payment/CardIOActivity.html#EXTRA_RESTRICT_POSTAL_CODE_TO_NUMERIC_ONLY))
   - `requireCardholderName` *boolean* `false` - Set to `true` if you need to collect the cardholder name. ([iOS](https://github.com/card-io/card.io-iOS-SDK/blob/ec9a8632c9fd879537354d4b9075aa487dcebe8b/CardIO/CardIOPaymentViewController.h#L140) / [Android](http://card-io.github.io/card.io-Android-SDK/io/card/payment/CardIOActivity.html#EXTRA_REQUIRE_CARDHOLDER_NAME))
   - `scanExpiry` *boolean* `true` - Set to `false` if you don't want the camera to try to scan the card expiration. ([iOS](https://github.com/card-io/card.io-iOS-SDK/blob/ec9a8632c9fd879537354d4b9075aa487dcebe8b/CardIO/CardIOPaymentViewController.h#L145) / [Android](http://card-io.github.io/card.io-Android-SDK/io/card/payment/CardIOActivity.html#EXTRA_SCAN_EXPIRY))

   - `disableBlurWhenBackgrounding` *boolean* `false` (iOS only) - Disable the blur of the screen when the app is backgrounded. ([iOS](https://github.com/card-io/card.io-iOS-SDK/blob/ec9a8632c9fd879537354d4b9075aa487dcebe8b/CardIO/CardIOPaymentViewController.h#L163))
   - `keepStatusBarStyle` *boolean* `false` (iOS only) - If `true`, the status bar's style will be kept as whatever your app has set it to. ([iOS](https://github.com/card-io/card.io-iOS-SDK/blob/ec9a8632c9fd879537354d4b9075aa487dcebe8b/CardIO/CardIOPaymentViewController.h#L48))
   - `detectionMode` *[CardIODetectionMode](#constants)* `false` (iOS only) - Set the detection mode. ([iOS](https://github.com/card-io/card.io-iOS-SDK/blob/ec9a8632c9fd879537354d4b9075aa487dcebe8b/CardIO/CardIOPaymentViewController.h#L123))
   - `suppressScannedCardImage` *boolean* `false` (iOS only) - If `true`, instead of displaying the image of the scanned card, present the manual entry screen with the scanned card number prefilled. ([iOS](https://github.com/card-io/card.io-iOS-SDK/blob/ec9a8632c9fd879537354d4b9075aa487dcebe8b/CardIO/CardIOPaymentViewController.h#L79))
   - `scannedImageDuration` *number* `0.1` (iOS only) - How long card.io will display an image of the card with the computed card number superimposed after a successful scan. ([iOS](https://github.com/card-io/card.io-iOS-SDK/blob/ec9a8632c9fd879537354d4b9075aa487dcebe8b/CardIO/CardIOPaymentViewController.h#L86))
   - `allowFreelyRotatingCardGuide` *boolean* `true` (iOS only) - By default, in camera view the card guide and the buttons always rotate to match the device's orientation. ([iOS](https://github.com/card-io/card.io-iOS-SDK/blob/ec9a8632c9fd879537354d4b9075aa487dcebe8b/CardIO/CardIOPaymentViewController.h#L155))

   - `noCamera` *boolean* `false` (Android only) - If set, the card will not be scanned with the camera. ([Android](http://card-io.github.io/card.io-Android-SDK/io/card/payment/CardIOActivity.html#EXTRA_NO_CAMERA))
   - `unblurDigits` *number* `-1` (Android only) - Privacy feature. How many of the Card number digits NOT to blur on the resulting image. Setting it to 4 will blur all digits except the last four. ([Android](http://card-io.github.io/card.io-Android-SDK/io/card/payment/CardIOActivity.html#EXTRA_UNBLUR_DIGITS))
   - `usePaypalActionbarIcon` *boolean* `false` (Android only) - Use the PayPal icon in the ActionBar. ([Android](http://card-io.github.io/card.io-Android-SDK/io/card/payment/CardIOActivity.html#EXTRA_USE_PAYPAL_ACTIONBAR_ICON))

### CreditCard

An object with the following keys:

- `cardType` *string* - Localized card type.
- `cardNumber` *string* - Card number.
- `redactedCardNumber` *string* - Card number with all but the last four digits obfuscated.
- `expiryMonth` *number* - Expiry month with january as 1 (may be 0 if expiry information was not requested).
- `expiryYear` *number* - Expiry year (may be 0 if expiry information was not requested).
- `cvv` *string* - Security code.
- `postalCode` *string* - Postal code. Format is country dependent.
- `scanned` *boolean* (iOS only) - Was the card number scanned (as opposed to entered manually)?
- `cardholderName` *string* - Card holder name.

### CardIOUtilities

#### Methods

`preload` -> void (iOS only) - The preload method prepares card.io to launch faster. ([iOS](https://github.com/card-io/card.io-iOS-SDK/blob/ec9a8632c9fd879537354d4b9075aa487dcebe8b/CardIO/CardIOUtilities.h#L31))

#### Constants

`CAN_READ_CARD_WITH_CAMERA`: Boolean
   
Determine whether this device supports camera-based card scanning. ([iOS](https://github.com/card-io/card.io-iOS-SDK/blob/ec9a8632c9fd879537354d4b9075aa487dcebe8b/CardIO/CardIOUtilities.h#L24) / [Android](http://card-io.github.io/card.io-Android-SDK/io/card/payment/CardIOActivity.html#canReadCardWithCamera--))

`DETECTION_MODE`: String

  - `IMAGE_AND_NUMBER` (CardIODetectionModeCardImageAndNumber) - the scanner must successfully identify the card number.
  - `IMAGE` (CardIODetectionModeCardImageOnly) - don't scan the card, just detect a credit-card-shaped card.
  - `AUTOMATIC` (CardIODetectionModeAutomatic) - start as CardIODetectionModeCardImageAndNumber, but fall back to CardIODetectionModeCardImageOnly if scanning has not succeeded within a reasonable time.

## License

MIT
