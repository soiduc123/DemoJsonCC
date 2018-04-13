//
//  User.h
//  DemoJsonOC
//
//  Created by Uyen Cao on 4/11/18.
//  Copyright © 2018 Uyen Cao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject
@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *address;
@property (nonatomic, assign) NSInteger year;
@property (nonatomic, assign) NSInteger age;
@property (nonatomic, assign) BOOL sex;

@end
