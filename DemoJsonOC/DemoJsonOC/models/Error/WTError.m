//
//  WTError.m
//  DemoJsonOC
//
//  Created by Đức Anh Trần on 4/26/18.
//  Copyright © 2018 Uyen Cao. All rights reserved.
//

#import "WTError.h"

@implementation WTError

+(NSDictionary *) JSONKeyPathsByPropertyKey {
    return @{
        @"cod" : @"cod",
        @"message" : @"message"
    };
}

@end
