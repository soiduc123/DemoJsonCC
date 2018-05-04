//
//  WTWeatherModel.h
//  DemoJsonOC
//
//  Created by Đức Anh Trần on 4/26/18.
//  Copyright © 2018 Uyen Cao. All rights reserved.
//

#import <Mantle.h>

@interface WTWeatherModel : MTLModel <MTLJSONSerializing>

@property (nonatomic, assign) NSNumber *id;
@property (nonatomic, copy) NSString *main;
@property (nonatomic, copy) NSString *desc;
@property (nonatomic, copy) NSString *icon;

@end
