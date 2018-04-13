//
//  APIHandler.m
//  DemoJsonOC
//
//  Created by Đức Anh Trần on 4/13/18.
//  Copyright © 2018 Uyen Cao. All rights reserved.
//

#import "APIHandler.h"

@implementation APIHandler
- (void)fetchDataFromUrl:(NSURL *)url responseHandler:(void (^)(NSDictionary *response, NSError *error))handler {
#pragma mark - Create session
    NSURLSessionConfiguration *sessionConfig = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration: sessionConfig];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL: url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval: 10.0];
#pragma mark - Fetch Data
    NSURLSessionDataTask *postDataTask = [session dataTaskWithRequest: request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            handler(nil, error);
        } else {
            handler([NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil], nil);
        }
    }];
#pragma mark - Resume task if it suspended
    [postDataTask resume];
}
@end
