//
//  XHWeather.m
//  XHWeather-V2
//
//  Created by 00 on 15-7-1.
//  Copyright (c) 2015年 wxh. All rights reserved.
//

#import "XHWeather.h"

@implementation XHWeather

-(instancetype)initWithDictionary:(NSDictionary *)dict{
    self = [super init];
    if (self) {
        self.date = dict[@"date"];
        self.iconURLStr = dict[@"hourly"][0][@"weatherIconUrl"][0][@"value"];
        self.maxtempC = dict[@"maxtempC"];
        self.mintempC = dict[@"mintempC"];
        
        NSArray* array = dict[@"hourly"];
        NSMutableArray *arrayCopy = [NSMutableArray new];
        for (NSDictionary *dict in array) {
            XHWeather *weather = [[XHWeather alloc] init];
            weather.date = dict[@"time"];
            weather.iconURLStr = dict[@"weatherIconUrl"][0][@"value"];
            weather.temp = dict[@"tempC"];
            [arrayCopy addObject:weather];
        }
        self.hourlyArray = [arrayCopy copy];
        
    }
    
    return self;
}

@end
