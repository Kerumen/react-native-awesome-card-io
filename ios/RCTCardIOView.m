//
//  RCTCardIOView.m
//  RNCardIO
//
//  Created by Yann Pringault on 25/08/16.
//  Copyright © 2016 Yann Pringault. All rights reserved.
//

#import "RCTCardIOView.h"

@implementation RCTCardIOView

RCT_EXPORT_MODULE();

RCT_EXPORT_VIEW_PROPERTY(languageOrLocale, NSString);
RCT_EXPORT_VIEW_PROPERTY(guideColor, UIColor);
RCT_EXPORT_VIEW_PROPERTY(useCardIOLogo, BOOL);
RCT_EXPORT_VIEW_PROPERTY(hideCardIOLogo, BOOL);
RCT_EXPORT_VIEW_PROPERTY(allowFreelyRotatingCardGuide, BOOL);
RCT_EXPORT_VIEW_PROPERTY(scanInstructions, NSString);
RCT_EXPORT_VIEW_PROPERTY(scanExpiry, BOOL);
RCT_EXPORT_VIEW_PROPERTY(scannedImageDuration, CGFloat);
RCT_EXPORT_VIEW_PROPERTY(detectionMode, CardIODetectionMode);

-(UIView *)view {
    CardIOView *cardIOView = [[CardIOView alloc] init];
    cardIOView.delegate = self;
    return cardIOView;
}

-(void)cardIOView:(CardIOView *)cardIOView didScanCard:(CardIOCreditCardInfo *)cardInfo {

    NSString *cardType = [CardIOCreditCardInfo displayStringForCardType:cardInfo.cardType usingLanguageOrLocale:cardIOView.languageOrLocale];

    [self.bridge.eventDispatcher
     sendAppEventWithName:@"didScanCard"
     body:@{
            @"cardType": cardType,
            @"cardNumber": cardInfo.cardNumber ?: [NSNull null],
            @"redactedCardNumber": cardInfo.redactedCardNumber ?: [NSNull null],
            @"expiryMonth": @(cardInfo.expiryMonth) ?: [NSNull null],
            @"expiryYear": @(cardInfo.expiryYear) ?: [NSNull null],
            @"cvv": cardInfo.cvv ?: [NSNull null],
            @"postalCode": cardInfo.postalCode ?: [NSNull null],
            @"scanned": @(cardInfo.scanned),
            @"cardholderName": cardInfo.cardholderName ?: [NSNull null]
        }
    ];
}

@end
  