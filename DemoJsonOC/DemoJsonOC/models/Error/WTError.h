//
//  WTError.h
//  DemoJsonOC
//
//  Created by Đức Anh Trần on 4/26/18.
//  Copyright © 2018 Uyen Cao. All rights reserved.
//

#import <Mantle.h>

@interface WTError : MTLModel <MTLJSONSerializing>

@property (nonatomic, copy) NSString *cod;
@property (nonatomic, copy) NSString *message;

@end
