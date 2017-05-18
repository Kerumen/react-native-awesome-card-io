//
//  RCTCardIOPaymentViewController.h
//  RNCardIO
//
//  Created by Yann Pringault on 25/08/16.
//  Copyright © 2016 Yann Pringault. All rights reserved.
//

#ifndef RCTCardIOModule_h
#define RCTCardIOModule_h

#if __has_include(<React/RCTBridge.h>)
// React Native >= 0.40
#import <React/RCTRootView.h>
#import <React/RCTBridge.h>
#import <React/RCTUIManager.h>
#import <React/RCTUtils.h>
#else
// React Native <= 0.39
#import "RCTRootView.h"
#import "RCTBridge.h"
#import "RCTUIManager.h"
#import "RCTUtils.h"
#endif

#import "CardIO.h"
#import "RCTConvert+CardIODetectionMode.h"

@interface RCTCardIOModule : NSObject <RCTBridgeModule>

@end

#endif /* RCTCardIOModule_h */
