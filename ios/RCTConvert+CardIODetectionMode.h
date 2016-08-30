//
//  RCTConvert+CardIODetectionMode.h
//  RNCardIO
//
//  Created by Yann Pringault on 25/08/16.
//  Copyright © 2016 Yann Pringault. All rights reserved.
//

#ifndef RCTConvert_CardIODetectionMode_h
#define RCTConvert_CardIODetectionMode_h

#import "RCTConvert.h"
#import "CardIO.h"

#define DETECTION_MODE  @{ @"IMAGE_AND_NUMBER" : @(CardIODetectionModeCardImageAndNumber), @"IMAGE" : @(CardIODetectionModeCardImageOnly), @"AUTOMATIC" : @(CardIODetectionModeAutomatic) }

@interface RCTConvert(CardIODetectionMode)

+ (CardIODetectionMode)CardIODetectionMode:(id)json;

@end

#endif /* RCTConvert_CardIODetectionMode_h */
