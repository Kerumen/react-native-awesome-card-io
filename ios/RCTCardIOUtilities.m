//
//  RCTCardIOUtilities.m
//  RNCardIO
//
//  Created by Yann Pringault on 25/08/16.
//  Copyright © 2016 Yann Pringault. All rights reserved.
//

#import "RCTCardIOUtilities.h"

@implementation RCTCardIOUtilities

RCT_EXPORT_MODULE();

- (NSDictionary *)constantsToExport {
    return @{
        @"DETECTION_MODE": DETECTION_MODE
    };
}

+ (BOOL)requiresMainQueueSetup
{
    return YES;
}

RCT_EXPORT_METHOD(preload) {
    return [CardIOUtilities preload];
}

RCT_REMAP_METHOD(canReadCardWithCamera, canReadCardWithCameraResolver:(RCTPromiseResolveBlock)resolve rejecter:(RCTPromiseRejectBlock)reject) {
    resolve(@([CardIOUtilities canReadCardWithCamera]));
}

@end
