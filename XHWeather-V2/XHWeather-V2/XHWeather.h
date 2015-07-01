//
//  XHWeather.h
//  XHWeather-V2
//
//  Created by 00 on 15-7-1.
//  Copyright (c) 2015年 wxh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XHWeather : NSObject

@property (strong, nonatomic) NSString *date;
@property (strong, nonatomic) NSString *iconURLStr;
@property (strong, nonatomic) NSString *maxtempC;
@property (strong, nonatomic) NSString *mintempC;
@property (strong, nonatomic) NSString *temp;
@property (strong, nonatomic) NSArray *hourlyArray;
-(instancetype)initWithDictionary:(NSDictionary *)dict;

@end
