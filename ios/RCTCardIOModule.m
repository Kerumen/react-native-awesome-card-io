//
//  RCTCardIOPaymentViewController.m
//  RNCardIO
//
//  Created by Yann Pringault on 25/08/16.
//  Copyright © 2016 Yann Pringault. All rights reserved.
//

#import "RCTCardIOModule.h"

@interface RCTCardIOModule () <CardIOPaymentViewControllerDelegate>
@end

@implementation RCTCardIOModule {
    RCTPromiseResolveBlock _resolve;
    RCTPromiseRejectBlock _reject;
}

RCT_EXPORT_MODULE();

@synthesize bridge = _bridge;

- (void)parseConfig:(NSDictionary *)config viewController:(CardIOPaymentViewController *)viewController {
    if ([config objectForKey:@"languageOrLocale"] != nil) {
        NSString *value = [RCTConvert NSString:config[@"languageOrLocale"]];
        [viewController setValue:value forKey:@"languageOrLocale"];
    }
    if ([config objectForKey:@"keepStatusBarStyle"] != nil) {
        BOOL value = [RCTConvert BOOL:config[@"keepStatusBarStyle"]];
        [viewController setValue:@(value) forKey:@"keepStatusBarStyle"];
    }
    if ([config objectForKey:@"navigationBarStyle"] != nil) {
        UIBarStyle value = [RCTConvert UIBarStyle:config[@"navigationBarStyle"]];
        [viewController setValue:@(value) forKey:@"navigationBarStyle"];
    }
    if ([config objectForKey:@"navigationBarTintColor"] != nil) {
        UIColor *value = [RCTConvert UIColor:config[@"navigationBarTintColor"]];
        [viewController setValue:value forKey:@"navigationBarTintColor"];
    }
    if ([config objectForKey:@"disableBlurWhenBackgrounding"] != nil) {
        BOOL value = [RCTConvert BOOL:config[@"disableBlurWhenBackgrounding"]];
        [viewController setValue:@(value) forKey:@"disableBlurWhenBackgrounding"];
    }
    if ([config objectForKey:@"guideColor"] != nil) {
        UIColor *value = [RCTConvert UIColor:config[@"guideColor"]];
        [viewController setValue:value forKey:@"guideColor"];
    }
    if ([config objectForKey:@"suppressScanConfirmation"] != nil) {
        BOOL value = [RCTConvert BOOL:config[@"suppressScanConfirmation"]];
        [viewController setValue:@(value) forKey:@"suppressScanConfirmation"];
    }
    if ([config objectForKey:@"suppressScannedCardImage"] != nil) {
        BOOL value = [RCTConvert BOOL:config[@"suppressScannedCardImage"]];
        [viewController setValue:@(value) forKey:@"suppressScannedCardImage"];
    }
    if ([config objectForKey:@"scannedImageDuration"] != nil) {
        CGFloat value = [RCTConvert CGFloat:config[@"scannedImageDuration"]];
        [viewController setValue:@(value) forKey:@"scannedImageDuration"];
    }
    if ([config objectForKey:@"maskManualEntryDigits"] != nil) {
        BOOL value = [RCTConvert BOOL:config[@"maskManualEntryDigits"]];
        [viewController setValue:@(value) forKey:@"maskManualEntryDigits"];
    }
    if ([config objectForKey:@"scanInstructions"] != nil) {
        NSString *value = [RCTConvert NSString:config[@"scanInstructions"]];
        [viewController setValue:value forKey:@"scanInstructions"];
    }
    if ([config objectForKey:@"hideCardIOLogo"] != nil) {
        BOOL value = [RCTConvert BOOL:config[@"hideCardIOLogo"]];
        [viewController setValue:@(value) forKey:@"hideCardIOLogo"];
    }
    if ([config objectForKey:@"detectionMode"] != nil) {
        CardIODetectionMode value = [RCTConvert CardIODetectionMode:config[@"detectionMode"]];
        [viewController setValue:@(value) forKey:@"detectionMode"];
    }
    if ([config objectForKey:@"collectExpiry"] != nil) {
        BOOL value = [RCTConvert BOOL:config[@"collectExpiry"]];
        [viewController setValue:@(value) forKey:@"collectExpiry"];
    }
    if ([config objectForKey:@"collectCVV"] != nil) {
        BOOL value = [RCTConvert BOOL:config[@"collectCVV"]];
        [viewController setValue:@(value) forKey:@"collectCVV"];
    }
    if ([config objectForKey:@"collectPostalCode"] != nil) {
        BOOL value = [RCTConvert BOOL:config[@"collectPostalCode"]];
        [viewController setValue:@(value) forKey:@"collectPostalCode"];
    }
    if ([config objectForKey:@"restrictPostalCodeToNumericOnly"] != nil) {
        BOOL value = [RCTConvert BOOL:config[@"restrictPostalCodeToNumericOnly"]];
        [viewController setValue:@(value) forKey:@"restrictPostalCodeToNumericOnly"];
    }
    if ([config objectForKey:@"collectCardholderName"] != nil) {
        BOOL value = [RCTConvert BOOL:config[@"collectCardholderName"]];
        [viewController setValue:@(value) forKey:@"collectCardholderName"];
    }
    if ([config objectForKey:@"scanExpiry"] != nil) {
        BOOL value = [RCTConvert BOOL:config[@"scanExpiry"]];
        [viewController setValue:@(value) forKey:@"scanExpiry"];
    }
    if ([config objectForKey:@"useCardIOLogo"] != nil) {
        BOOL value = [RCTConvert BOOL:config[@"useCardIOLogo"]];
        [viewController setValue:@(value) forKey:@"useCardIOLogo"];
    }
    if ([config objectForKey:@"allowFreelyRotatingCardGuide"] != nil) {
        BOOL value = [RCTConvert BOOL:config[@"allowFreelyRotatingCardGuide"]];
        [viewController setValue:@(value) forKey:@"allowFreelyRotatingCardGuide"];
    }
    if ([config objectForKey:@"disableManualEntryButtons"] != nil) {
        BOOL value = [RCTConvert BOOL:config[@"disableManualEntryButtons"]];
        [viewController setValue:@(value) forKey:@"disableManualEntryButtons"];
    }
}

RCT_EXPORT_METHOD(scanCard:(NSDictionary *)config resolver:(RCTPromiseResolveBlock)resolve rejecter:(RCTPromiseRejectBlock)reject) {
    _resolve = resolve;
    _reject = reject;
    CardIOPaymentViewController *scanViewController = [[CardIOPaymentViewController alloc] initWithPaymentDelegate:self];
    
    [self parseConfig:config viewController:scanViewController];
    
    UIViewController *rootViewController = RCTPresentedViewController();
    [rootViewController presentViewController:scanViewController animated:YES completion:nil];
}

- (void)userDidCancelPaymentViewController:(CardIOPaymentViewController *)scanViewController {
    [scanViewController dismissViewControllerAnimated:YES completion:nil];
    _reject(@"user_cancelled", @"The user cancelled", nil);
}

- (void)userDidProvideCreditCardInfo:(CardIOCreditCardInfo *)cardInfo inPaymentViewController:(CardIOPaymentViewController *)scanViewController {
    [scanViewController dismissViewControllerAnimated:YES completion:nil];
    
    NSString *cardType = [CardIOCreditCardInfo displayStringForCardType:cardInfo.cardType usingLanguageOrLocale:scanViewController.languageOrLocale];
    
    _resolve(@{
        @"cardType": cardType,
        @"cardNumber": cardInfo.cardNumber ?: [NSNull null],
        @"redactedCardNumber": cardInfo.redactedCardNumber ?: [NSNull null],
        @"expiryMonth": @(cardInfo.expiryMonth) ?: [NSNull null],
        @"expiryYear": @(cardInfo.expiryYear) ?: [NSNull null],
        @"cvv": cardInfo.cvv ?: [NSNull null],
        @"postalCode": cardInfo.postalCode ?: [NSNull null],
        @"scanned": @(cardInfo.scanned)
    });
}

- (dispatch_queue_t)methodQueue
{
    return dispatch_get_main_queue();
}

@end
