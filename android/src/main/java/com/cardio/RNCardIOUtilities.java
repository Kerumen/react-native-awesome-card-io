package com.cardio;

import com.facebook.react.bridge.Callback;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;

import io.card.payment.CardIOActivity;

public class RNCardIOUtilities extends ReactContextBaseJavaModule {

  public RNCardIOUtilities(ReactApplicationContext reactContext) {
    super(reactContext);
  }

  @Override
  public String getName() {
    return "RCTCardIOUtilities";
  }

  @ReactMethod
  public void canReadCardWithCamera(Callback callback) {
    callback.invoke(CardIOActivity.canReadCardWithCamera());
  }
}