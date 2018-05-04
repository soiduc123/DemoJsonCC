//
//  WTSysModel.m
//  DemoJsonOC
//
//  Created by Đức Anh Trần on 4/26/18.
//  Copyright © 2018 Uyen Cao. All rights reserved.
//

#import "WTSysModel.h"

@implementation WTSysModel

+(NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
        @"id" : @"id",
        @"name" : @"name",
        @"cod" : @"cod"
    };
}

@end
