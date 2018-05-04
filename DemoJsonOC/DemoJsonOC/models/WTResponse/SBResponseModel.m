//
//  SBResponseModel.m
//  DemoJsonOC
//
//  Created by Đức Anh Trần on 4/24/18.
//  Copyright © 2018 Uyen Cao. All rights reserved.
//

#import "SBResponseModel.h"

@implementation SBResponseModel

// convert JSON to model
+(NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"docs": @"docs",
             @"facets": @"facets",
             @"numFound": @"numFound"
    }
}

@end
