//
//  WTResponseModel.h
//
//  Copyright (c) 2017 Entertainment Magpie Ltd and/or its affiliates. All rights reserved.
//  Unauthorised copying of this file, via any medium is strictly prohibited.
//  Proprietary and confidential.
//  DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
//
//  Created by Duc Anh Tran on 24/04/18.
//

#import "Mantle.h"
#import "WTMainModel.h"
#import "WTCoordinateModel.h"
#import "WTWeatherModel.h"
#import "WTWindModel.h"
#import "WTSysModel.h"
#import "WTClouds.h"
#import "WTError.h"
/*!
 * @class WTResponseModel
 *
 * @discussion *  The WTResponseModel class represents a Mantle model.
 * This is top level class for Weather response, contains main, wind, clouds status.
 *
 * @superclass SuperClass: MTLModel <MTLJSONSerializing>
 */
@interface WTResponseModel : MTLModel <MTLJSONSerializing>

@property (nonatomic, copy) NSString *base;
@property (nonatomic, strong) WTClouds *clouds;
//this is coordinate of the city
@property (nonatomic, strong) WTCoordinateModel *coordinate;
@property (nonatomic, assign) NSNumber* dt;
// this is main wheather status
@property (nonatomic, strong) WTMainModel *main;
@property (nonatomic, strong) WTSysModel *sys;
@property (nonatomic, assign) NSNumber* visibility;
@property (nonatomic, strong) NSArray<WTWeatherModel *> *weather;
@property (nonatomic, strong) WTWindModel *wind;
@property (nonatomic, strong) WTError *error;

@end
