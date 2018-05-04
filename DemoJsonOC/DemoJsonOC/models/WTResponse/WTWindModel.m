//
//  WTWindModel.m
//  DemoJsonOC
//
//  Created by Đức Anh Trần on 4/26/18.
//  Copyright © 2018 Uyen Cao. All rights reserved.
//

#import "WTWindModel.h"

@implementation WTWindModel

+(NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
        @"speed" : @"speed",
        @"deg" : @"deg"
    };
}

@end
