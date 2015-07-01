//
//  XHHeaderView.h
//  XHWeather-V2
//
//  Created by 00 on 15-7-1.
//  Copyright (c) 2015年 wxh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XHHeaderView : UIView

@property (strong, nonatomic) UILabel *cityLabel;
@property (strong, nonatomic) UILabel *tempretureLabel;
@property (strong, nonatomic) UIImageView *iconView;
@property (strong, nonatomic) UILabel *conditionLabel;
@property (strong, nonatomic) UILabel *hiloLabel;
-(instancetype)initWithFrame:(CGRect)frame;

@end
