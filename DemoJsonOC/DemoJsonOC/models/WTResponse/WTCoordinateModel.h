//
//  WTCoordinateModel.h
//  DemoJsonOC
//
//  Created by Đức Anh Trần on 4/26/18.
//  Copyright © 2018 Uyen Cao. All rights reserved.
//

#import <Mantle.h>

@interface WTCoordinateModel : MTLModel <MTLJSONSerializing>

@property (nonatomic, assign) NSNumber *lon;
@property (nonatomic, assign) NSNumber *lat;

@end
