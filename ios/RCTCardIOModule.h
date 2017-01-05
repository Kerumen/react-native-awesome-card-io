//
//  RCTCardIOPaymentViewController.h
//  RNCardIO
//
//  Created by Yann Pringault on 25/08/16.
//  Copyright © 2016 Yann Pringault. All rights reserved.
//

#ifndef RCTCardIOModule_h
#define RCTCardIOModule_h

#import <React/RCTRootView.h>
#import <React/RCTBridge.h>
#import <React/RCTUIManager.h>
#import <React/RCTUtils.h>

#import "CardIO.h"
#import "RCTConvert+CardIODetectionMode.h"

@interface RCTCardIOModule : NSObject <RCTBridgeModule>

@end

#endif /* RCTCardIOModule_h */
