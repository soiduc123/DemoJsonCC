//
//  WTMainModel.h
//  DemoJsonOC
//
//  Created by Đức Anh Trần on 4/24/18.
//  Copyright © 2018 Uyen Cao. All rights reserved.
//
#import "Mantle.h"

@interface WTMainModel : MTLModel <MTLJSONSerializing>

@property (nonatomic, assign) NSNumber *temp;
@property (nonatomic, assign) NSNumber *pressure;
@property (nonatomic, assign) NSNumber *humidity;
@property (nonatomic, assign) NSNumber *temp_min;
@property (nonatomic, assign) NSNumber *temp_max;

@end
