//
//  XHLabelTool.m
//  XHWeather-V2
//
//  Created by 00 on 15-7-1.
//  Copyright (c) 2015年 wxh. All rights reserved.
//

#import "XHLabelTool.h"

@implementation XHLabelTool
+(UILabel*)labelWithFrame:(CGRect)frame{
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    
    label.text = @"loading";
    label.textAlignment = NSTextAlignmentCenter;
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont fontWithName:@"HelveticalNeue-Light" size:30];
    return label;
}
@end
