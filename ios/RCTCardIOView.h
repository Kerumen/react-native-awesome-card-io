//
//  RCTCardIOView.h
//  RNCardIO
//
//  Created by Yann Pringault on 25/08/16.
//  Copyright © 2016 Yann Pringault. All rights reserved.
//

#ifndef RCTCardIOView_h
#define RCTCardIOView_h

#if __has_include(<React/RCTBridge.h>)
// React Native >= 0.40
#import <React/RCTViewManager.h>
#import <React/RCTBridge.h>
#else
// React Native <= 0.39
#import "RCTViewManager.h"
#import "RCTBridge.h"
#endif

#import "CardIO.h"

@interface RCTCardIOView : RCTViewManager <CardIOViewDelegate>

@end

#endif /* RCTCardIOView_h */
