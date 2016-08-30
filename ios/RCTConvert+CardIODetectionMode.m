//
//  RCTConvert+CardIODetectionMode.m
//  RNCardIO
//
//  Created by Yann Pringault on 25/08/16.
//  Copyright © 2016 Yann Pringault. All rights reserved.
//

#import "RCTConvert+CardIODetectionMode.h"

@implementation RCTConvert(CardIODetectionMode)

RCT_ENUM_CONVERTER(CardIODetectionMode, (DETECTION_MODE), CardIODetectionModeCardImageAndNumber, integerValue);

@end