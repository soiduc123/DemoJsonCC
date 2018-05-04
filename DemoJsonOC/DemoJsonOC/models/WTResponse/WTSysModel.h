//
//  WTSysModel.h
//  DemoJsonOC
//
//  Created by Đức Anh Trần on 4/26/18.
//  Copyright © 2018 Uyen Cao. All rights reserved.
//

#import <Mantle.h>

@interface WTSysModel : MTLModel <MTLJSONSerializing>

@property (nonatomic, assign) NSNumber *id;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) NSNumber *cod;

@end
