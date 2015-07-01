//
//  XHWeatherCell.h
//  XHWeather-V2
//
//  Created by 00 on 15-7-1.
//  Copyright (c) 2015年 wxh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XHWeather.h"
@interface XHWeatherCell : UITableViewCell
-(instancetype)initWithWeather:(XHWeather*)weather;
-(instancetype)initWithWeatherHourly:(XHWeather*)weather;
@end
