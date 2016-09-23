package com.cardio;

import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;

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

  @Override
  public Map<String, Object> getConstants() {
    final Map<String, Object> constants = new HashMap<>();
    constants.put("CAN_READ_CARD_WITH_CAMERA", CardIOActivity.canReadCardWithCamera());
    return constants;
  }
}
