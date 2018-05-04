//
//  WTMainModel.m
//  DemoJsonOC
//
//  Created by Đức Anh Trần on 4/24/18.
//  Copyright © 2018 Uyen Cao. All rights reserved.
//

#import "WTMainModel.h"

@implementation WTMainModel

+(NSDictionary *) JSONKeyPathsByPropertyKey {
    return @{
             @"humidity": @"humidity",
             @"pressure": @"pressure",
             @"temp": @"temp",
             @"temp_max": @"temp_max",
             @"temp_min": @"temp_min"
             };
}

@end
