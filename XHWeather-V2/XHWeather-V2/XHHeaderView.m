//
//  XHHeaderView.m
//  XHWeather-V2
//
//  Created by 00 on 15-7-1.
//  Copyright (c) 2015年 wxh. All rights reserved.
//

#import "XHHeaderView.h"
#import "XHLabelTool.h"
static CGFloat cityHeight = 30;
static CGFloat statusbarHeight = 20;
static CGFloat inset = 20;
static CGFloat temperatureHeight = 110;
static CGFloat hiloHeight = 40;
static CGFloat iconHeight = 30;
@interface XHHeaderView()


@end
@implementation XHHeaderView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        CGRect cityFrame = CGRectMake(0, statusbarHeight, frame.size.width, cityHeight);
        self.cityLabel = [XHLabelTool labelWithFrame:cityFrame];
        // cityLabel.backgroundColor = [UIColor redColor];
        [self addSubview:self.cityLabel];
        
        CGRect tempreatureFrame = CGRectMake(inset, frame.size.height - (temperatureHeight+hiloHeight), frame.size.width - 2*inset, temperatureHeight);
        self.tempretureLabel = [XHLabelTool labelWithFrame:tempreatureFrame];
        self.tempretureLabel.backgroundColor = [UIColor clearColor];
        self.tempretureLabel.font = [UIFont fontWithName:@"HelveticaNeue-UltraLight" size:120];
        self.tempretureLabel.text = @"23";
        self.tempretureLabel.textColor = [UIColor whiteColor];
        [self addSubview:self.tempretureLabel];
        
        
        
        CGRect iconFrame = CGRectMake(inset, frame.size.height-(temperatureHeight+hiloHeight+iconHeight), iconHeight, iconHeight);
        self.iconView = [[UIImageView alloc] initWithFrame:iconFrame];
        //self.iconView.image = [UIImage imageNamed:@"weather-clear.png"];
        [self addSubview:self.iconView];
        
        CGRect conditionFrame = iconFrame;
        conditionFrame.size.width = frame.size.width - 2 * inset - iconHeight - 10;
        conditionFrame.origin.x = iconFrame.origin.x + iconHeight +10;
        self.conditionLabel = [XHLabelTool labelWithFrame:conditionFrame];
        self.conditionLabel.text = @"Clear";
        self.conditionLabel.textColor = [UIColor whiteColor];
        
        self.conditionLabel.backgroundColor = [UIColor clearColor];
        [self addSubview:self.conditionLabel];
        
        
        CGRect hiloFrame = CGRectMake(inset, frame.size.height - hiloHeight, frame.size.width - 2 *inset, hiloHeight);
        self.hiloLabel = [XHLabelTool labelWithFrame:hiloFrame];
        self.hiloLabel.backgroundColor = [UIColor blackColor];
        self.hiloLabel.text = @"23° / 12°";
        self.hiloLabel.backgroundColor = [UIColor clearColor];
        self.hiloLabel.textColor = [UIColor whiteColor];
        [self addSubview:self.hiloLabel];
    }
    return self;
}


@end
