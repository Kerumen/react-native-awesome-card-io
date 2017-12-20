package com.cardio;

import android.app.Activity;
import android.content.Intent;
import android.graphics.Color;

import com.facebook.react.bridge.ActivityEventListener;
import com.facebook.react.bridge.Arguments;
import com.facebook.react.bridge.Promise;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.facebook.react.bridge.ReadableMap;
import com.facebook.react.bridge.WritableMap;

import io.card.payment.CardIOActivity;
import io.card.payment.CreditCard;

public class RNCardIOModule extends ReactContextBaseJavaModule implements ActivityEventListener {

  public static final int CARD_IO_SCAN = 1;

  private Promise promise;

  public RNCardIOModule(ReactApplicationContext reactContext) {
    super(reactContext);
    reactContext.addActivityEventListener(this);
  }

  @Override
  public String getName() {
    return "RCTCardIOModule";
  }

  @ReactMethod
  public void scanCard(ReadableMap config, Promise promise) {
    this.promise = promise;
    Activity activity = getCurrentActivity();
    Intent scanIntent = new Intent(activity, CardIOActivity.class);
    scanIntent.putExtra(CardIOActivity.EXTRA_REQUIRE_EXPIRY, true);
    scanIntent.putExtra(CardIOActivity.EXTRA_REQUIRE_CVV, true);
    parseConfig(config, scanIntent);
    if (activity != null) {
      activity.startActivityForResult(scanIntent, CARD_IO_SCAN);
    }
  }

  public void parseConfig(ReadableMap config, Intent intent) {
    // Cross-platform settings
    if (config.hasKey("languageOrLocale")) {
      intent.putExtra(CardIOActivity.EXTRA_LANGUAGE_OR_LOCALE, config.getString("languageOrLocale"));
    }
    if (config.hasKey("guideColor")) {
      intent.putExtra(CardIOActivity.EXTRA_GUIDE_COLOR, Color.parseColor(config.getString("guideColor")));
    }
    if (config.hasKey("useCardIOLogo")) {
      intent.putExtra(CardIOActivity.EXTRA_USE_CARDIO_LOGO, config.getBoolean("useCardIOLogo"));
    }
    if (config.hasKey("hideCardIOLogo")) {
      intent.putExtra(CardIOActivity.EXTRA_HIDE_CARDIO_LOGO, config.getBoolean("hideCardIOLogo"));
    }
    if (config.hasKey("scanInstructions")) {
      intent.putExtra(CardIOActivity.EXTRA_SCAN_INSTRUCTIONS, config.getString("scanInstructions"));
    }
    if (config.hasKey("suppressManualEntry")) {
      intent.putExtra(CardIOActivity.EXTRA_SUPPRESS_MANUAL_ENTRY, config.getBoolean("suppressManualEntry"));
    }
    if (config.hasKey("suppressConfirmation")) {
      intent.putExtra(CardIOActivity.EXTRA_SUPPRESS_CONFIRMATION, config.getBoolean("suppressConfirmation"));
    }
    if (config.hasKey("requireExpiry")) {
      intent.putExtra(CardIOActivity.EXTRA_REQUIRE_EXPIRY, config.getBoolean("requireExpiry"));
    }
    if (config.hasKey("scanExpiry")) {
      intent.putExtra(CardIOActivity.EXTRA_SCAN_EXPIRY, config.getBoolean("scanExpiry"));
    }
    if (config.hasKey("requireCVV")) {
      intent.putExtra(CardIOActivity.EXTRA_REQUIRE_CVV, config.getBoolean("requireCVV"));
    }
    if (config.hasKey("requirePostalCode")) {
      intent.putExtra(CardIOActivity.EXTRA_REQUIRE_POSTAL_CODE, config.getBoolean("requirePostalCode"));
    }
    if (config.hasKey("restrictPostalCodeToNumericOnly")) {
      intent.putExtra(CardIOActivity.EXTRA_RESTRICT_POSTAL_CODE_TO_NUMERIC_ONLY, config.getBoolean("restrictPostalCodeToNumericOnly"));
    }
    if (config.hasKey("requireCardholderName")) {
      intent.putExtra(CardIOActivity.EXTRA_REQUIRE_CARDHOLDER_NAME, config.getBoolean("requireCardholderName"));
    }

    // Android-only settings
    if (config.hasKey("noCamera")) {
      intent.putExtra(CardIOActivity.EXTRA_NO_CAMERA, config.getBoolean("noCamera"));
    }
    if (config.hasKey("unblurDigits")) {
      intent.putExtra(CardIOActivity.EXTRA_UNBLUR_DIGITS, config.getInt("unblurDigits"));
    }
    if (config.hasKey("usePaypalActionbarIcon")) {
      intent.putExtra(CardIOActivity.EXTRA_USE_PAYPAL_ACTIONBAR_ICON, config.getBoolean("usePaypalActionbarIcon"));
    }
  }

  @Override
  public void onActivityResult(Activity activity, int requestCode, int resultCode, Intent data) {
    if (requestCode != CARD_IO_SCAN) {
      return;
    }
    if (data != null && data.hasExtra(CardIOActivity.EXTRA_SCAN_RESULT)) {
      CreditCard scanResult = data.getParcelableExtra(CardIOActivity.EXTRA_SCAN_RESULT);
      WritableMap res = Arguments.createMap();
      res.putString("cardType", scanResult.getCardType().getDisplayName(data.getStringExtra(CardIOActivity.EXTRA_LANGUAGE_OR_LOCALE)));
      res.putString("cardNumber", scanResult.cardNumber);
      res.putString("redactedCardNumber", scanResult.getRedactedCardNumber());
      res.putInt("expiryMonth", scanResult.expiryMonth);
      res.putInt("expiryYear", scanResult.expiryYear);
      res.putString("cvv", scanResult.cvv);
      res.putString("postalCode", scanResult.postalCode);
      res.putString("cardholderName", scanResult.cardholderName);
      promise.resolve(res);
    } else {
      promise.reject("user_cancelled", "The user cancelled");
    }
  }

  @Override
  public void onNewIntent(Intent intent) {}
}
