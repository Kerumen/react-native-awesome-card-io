//
//  RCTCardIOUtilities.h
//  RNCardIO
//
//  Created by Yann Pringault on 25/08/16.
//  Copyright © 2016 Yann Pringault. All rights reserved.
//

#ifndef RCTCardIOUtilities_h
#define RCTCardIOUtilities_h

#if __has_include(<React/RCTBridge.h>)
// React Native >= 0.40
#import <React/RCTBridge.h>
#else
// React Native <= 0.39
#import "RCTBridge.h"
#endif

#import "CardIO.h"
#import "RCTConvert+CardIODetectionMode.h"

@interface RCTCardIOUtilities : NSObject <RCTBridgeModule>

@end

#endif /* RCTCardIOUtilities_h */
