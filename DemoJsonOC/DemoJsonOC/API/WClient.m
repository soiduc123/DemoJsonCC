//
//  WTlient.m
//  DemoJsonOC
//
//  Created by Đức Anh Trần on 4/24/18.
//  Copyright © 2018 Uyen Cao. All rights reserved.
//

#import "WClient.h"
#import "WTResponseModel.h"
#import "WTError.h"

@implementation WClient


+ (NSDictionary *)modelClassesByResourcePath {
    return @{
        @"weather": [WTResponseModel class]
    };
}

+ (NSDictionary<NSString *,id> *)errorModelClassesByResourcePath {
    return @{ @"**": [WTError class] };
}

static WClient *shared;
static NSString *WT_BASE_URL = @"https://api.openweathermap.org/data/2.5/";
+ (instancetype)shared {
    if (shared == nil) {
        shared = [[self alloc] initWithBaseURL:[NSURL URLWithString:WT_BASE_URL]];
    }
    return shared;
}

-(void)getWeatherStatus:(NSString *)cityName withSuccessBlock:(void(^)(WTResponseModel *))successBlock andOnFailure:(WTFailureBlock)failureBlock {
    /// Search Parameter
    if ([cityName isEqualToString: @""]) {
        WTError *error = [[WTError alloc] init];
        error.cod = @"400";
        error.message = @"city name can't be null";
        failureBlock(error);
    } else {
        NSString *url = [NSString stringWithFormat: @"weather?q=%@&appid=54b757e7a79111bbb062aa4c2e506067", cityName];
        NSMutableCharacterSet *URLQueryPartAllowedCharacterSet = [[NSCharacterSet URLQueryAllowedCharacterSet] mutableCopy];
        //[URLQueryPartAllowedCharacterSet removeCharactersInString: @"+"];
        NSString *encodedPath = [url stringByAddingPercentEncodingWithAllowedCharacters:URLQueryPartAllowedCharacterSet];
        [self GET: encodedPath parameters:nil completion:^(OVCResponse * _Nullable response, NSError * _Nullable error) {
            if (error) {
                failureBlock(response.result ? (WTError *)response.result : (WTError *)error);
            } else {
                successBlock(response.result);
            }
        }];
    }
}
@end
