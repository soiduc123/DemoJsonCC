//
//  Test.m
//  DemoJsonOC
//
//  Created by Đức Anh Trần on 4/24/18.
//  Copyright © 2018 Uyen Cao. All rights reserved.
//

#import "Test.h"

@implementation Test
/// Shared instance of SBClient that will be used throught the application as a Singleton
static Test *shared;
#ifdef STAGING
static NSString *SB_BASE_URL = @"https://presbmusicmagpie.empathybroker.com/sb-musicmagpiestore/services/";
#else
static NSString *SB_BASE_URL = @"https://sbmusicmagpie.empathybroker.com/sb-musicmagpiestore/services/";
#endif

+ (instancetype)shared {
    if (shared == nil) {
        shared = [[Test alloc] initWithBaseURL:[NSURL URLWithString:SB_BASE_URL]];
    }
    return shared;
}

-(void)searchForText {
    NSString *path = @"search?q=applestart=0&sort=rank_sort desc&lang=en&filter=inStock:true OR backorderable:true&rows=25&";
    [self searchForPath: path withOnSuccess:^(NSData *data) {
        NSLog(@"SUCCESS   %@", data);
    } andOnFailure:^(NSError *error) {
        NSLog(@"ERROR   %@", error);
    }];
}
-(void)searchForPath:(NSString *) path withOnSuccess:(void(^)(NSData *))successBlock andOnFailure:(void(^)(NSError*))failureBlock {

    NSMutableCharacterSet *URLQueryPartAllowedCharacterSet = [[NSCharacterSet URLQueryAllowedCharacterSet] mutableCopy];
    [URLQueryPartAllowedCharacterSet removeCharactersInString:@"+"];
    NSString *encodedPath = [path stringByAddingPercentEncodingWithAllowedCharacters:URLQueryPartAllowedCharacterSet];
    
    [self GET: encodedPath parameters:nil completion:^(OVCResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            failureBlock(response.result ? ((NSError *) response.result) : error);
        } else {
            successBlock(response.result);
        }
    }];
}
@end
