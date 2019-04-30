package com.cardio;

import com.facebook.react.bridge.Arguments;
import com.facebook.react.bridge.Promise;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.facebook.react.bridge.WritableMap;
import com.facebook.react.uimanager.IllegalViewOperationException;

import io.card.payment.CardIOActivity;

import java.util.HashMap;
import java.util.Map;

public class RNCardIOUtilities extends ReactContextBaseJavaModule {
  public RNCardIOUtilities(ReactApplicationContext reactContext) {
    super(reactContext);
  }

  @Override
  public String getName() {
    return "RCTCardIOUtilities";
  }

  @ReactMethod
  public void canReadCardWithCamera(Promise promise) {
    try {
      promise.resolve(CardIOActivity.canReadCardWithCamera());
    } catch (Exception e) {
      promise.reject(e);
    }
  }
}
