//  Weather.m
//  DemoJsonOC
//
//  Created by Đức Anh Trần on 4/13/18.
//  Copyright © 2018 Uyen Cao. All rights reserved.
//

#import "Weather.h"
@implementation Weather

-(void)fetchDataFromUrl:(NSURL *)url {
//    NSString *urlAsString = [NSString stringWithFormat: @"http://api.openweathermap.org/data/2.5/weather?q=%@&appid=%@", cityName, APIKey];
//    NSLog(@"%@", urlAsString);
//    NSURL *url = [NSURL URLWithString: [urlAsString stringByReplacingOccurrencesOfString: @" " withString: @"%20"]];

    NSURLSessionConfiguration *sessionConfig = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration: sessionConfig];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL: url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval: 10.0];
    [request addValue: @"application/json" forHTTPHeaderField: @"Content-Type"];
    [request addValue: @"application/json" forHTTPHeaderField: @"Accept"];
    [request setHTTPMethod: @"POST"];
    
    NSURLSessionDataTask *postDataTask = [session dataTaskWithRequest: request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@"error %@", error);
        } else {
            NSData *weatherResponse = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
            NSLog(@"response %@", weatherResponse);
        }
    }];
    [postDataTask resume];
}
@end
