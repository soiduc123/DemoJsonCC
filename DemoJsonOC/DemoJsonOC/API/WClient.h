//
//  WTlient.h
//  DemoJsonOC
//
//  Created by Đức Anh Trần on 4/24/18.
//  Copyright © 2018 Uyen Cao. All rights reserved.
//

#import <Overcoat.h>
#import "WTResponseModel.h"
#import "WTError.h"
/*!
 * @brief A block that notifies that Get Wheather Status request completed successfully.
 * @param response Get Wheather Status response instance.
 */
typedef void (^WTSuccessBlock)(WTResponseModel *response);

/*!
 * @brief A block that notifies that Get Wheather Status request has failed.
 * @param error The error that occured.
 */
typedef void (^WTFailureBlock)(WTError *error);

@interface WClient : OVCHTTPSessionManager

+(instancetype)shared;

-(void)getWeatherStatus:(NSString *) cityName
                withSuccessBlock:(WTSuccessBlock)successBlock
                andOnFailure:(WTFailureBlock)failureBlock;
@end
