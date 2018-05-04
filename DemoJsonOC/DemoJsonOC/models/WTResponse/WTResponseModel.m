//
//  WTResponseModel.m
//
//  Copyright (c) 2017 Entertainment Magpie Ltd and/or its affiliates. All rights reserved.
//  Unauthorised copying of this file, via any medium is strictly prohibited.
//  Proprietary and confidential.
//  DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
//
//  Created by Duc Anh Tran on 24/04/18.
//

#import "WTResponseModel.h"
#import "WTMainModel.h"
#import "WTCoordinateModel.h"
#import "WTWeatherModel.h"
#import "WTWindModel.h"
#import "WTSysModel.h"

@implementation WTResponseModel

+(NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
        @"base" : @"base",
        @"clouds" : @"clouds",
        @"coordinate": @"coord",
        @"dt": @"dt",
        @"main": @"main",
        @"sys" : @"sys",
        @"visibility" : @"visibility",
        @"weather" : @"weather",
        @"wind" : @"wind"
    };
}

/*!
 * @discussion * Converts 'coordinate' property from 'WTCoordinateModel' class.
 *
 * @return NSValueTransformer
 */
+ (NSValueTransformer *)coordinateJSONTransformer {
    return [MTLJSONAdapter dictionaryTransformerWithModelClass:[WTCoordinateModel class]];
}

/*!
 * @discussion * Converts 'main' property from 'WTMainModel' class.
 *
 * @return NSValueTransformer
 */
+ (NSValueTransformer *)mainJSONTransformer {
    return [MTLJSONAdapter dictionaryTransformerWithModelClass: [WTMainModel class]];
}

/*!
 * @discussion * Converts 'weather' property from 'WTWeatherModel' class.
 *
 * @return NSValueTransformer
 */
+ (NSValueTransformer *)weatherJSONTransformer {
    return [MTLJSONAdapter arrayTransformerWithModelClass:[WTWeatherModel class]];
}

/*!
 * @discussion * Converts 'wind' property from 'WTWindModel' class.
 *
 * @return NSValueTransformer
 */
+ (NSValueTransformer *)windJSONTransformer {
    return [MTLJSONAdapter dictionaryTransformerWithModelClass:[WTWindModel class]];
}

/*!
 * @discussion * Converts 'sys' property from 'WTSysModel' class.
 *
 * @return NSValueTransformer
 */
+ (NSValueTransformer *)sysJSONTransformer {
    return [MTLJSONAdapter dictionaryTransformerWithModelClass:[WTSysModel class]];
}

@end
