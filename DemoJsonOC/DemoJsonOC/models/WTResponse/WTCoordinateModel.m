//
//  WTCoordinateModel.m
//  DemoJsonOC
//
//  Created by Đức Anh Trần on 4/26/18.
//  Copyright © 2018 Uyen Cao. All rights reserved.
//

#import "WTCoordinateModel.h"

@implementation WTCoordinateModel

+(NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
        @"lon" : @"lon",
        @"lat" : @"lat"
    };
}

@end
