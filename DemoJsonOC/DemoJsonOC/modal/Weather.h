//
//  Weather.h
//  DemoJsonOC
//
//  Created by Đức Anh Trần on 4/13/18.
//  Copyright © 2018 Uyen Cao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Weather : NSObject
@property (nonatomic, assign) NSInteger humidity;
@property (nonatomic, assign) NSInteger pressure;
@property (nonatomic, retain) NSString *temperature;
@property (nonatomic, retain) NSString *windSpeed;
@property (nonatomic, assign) NSInteger clouds;
@end
