//
//  Test.h
//  DemoJsonOC
//
//  Created by Đức Anh Trần on 4/24/18.
//  Copyright © 2018 Uyen Cao. All rights reserved.
//

#import <Overcoat/Overcoat.h>

@interface Test : OVCHTTPSessionManager
+ (instancetype)shared;
-(void)searchForText;
-(void)searchForPath:(NSString *) path withOnSuccess:(void(^)(NSData *))successBlock andOnFailure:(void(^)(NSError*))failureBlock;
@end
