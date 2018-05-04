//
//  WTWeatherModel.m
//  DemoJsonOC
//
//  Created by Đức Anh Trần on 4/26/18.
//  Copyright © 2018 Uyen Cao. All rights reserved.
//

#import "WTWeatherModel.h"

@implementation WTWeatherModel

+(NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
        @"id" : @"id",
        @"main" : @"main",
        @"desc" : @"description",
        @"icon" : @"icon"
    };
}

@end
