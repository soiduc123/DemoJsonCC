//
//  APIHandler.h
//  DemoJsonOC
//
//  Created by Đức Anh Trần on 4/13/18.
//  Copyright © 2018 Uyen Cao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface APIHandler : NSObject
-(void)fetchDataFromUrl:(NSURL *)url responseHandler:(void (^)(NSDictionary *response, NSError *error))handler;
@end
