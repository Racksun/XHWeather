//
//  XHWeatherCell.m
//  XHWeather-V2
//
//  Created by 00 on 15-7-1.
//  Copyright (c) 2015年 wxh. All rights reserved.
//

#import "XHWeatherCell.h"

@implementation XHWeatherCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}


-(instancetype)initWithWeather:(XHWeather*)weather{
    self = [super initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"self"];
    if (self) {
        NSData *imageData = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:weather.iconURLStr]];
        self.imageView.image = [[UIImage alloc] initWithData:imageData];
        self.textLabel.text = weather.date;
        self.detailTextLabel.text = [NSString stringWithFormat:@"%@/%@",weather.mintempC,weather.maxtempC];
    }
    return self;
}

-(instancetype)initWithWeatherHourly:(XHWeather *)weather{
    
    self = [super initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"self"];
    if (self) {
        
        
        
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            NSData *imageData = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:weather.iconURLStr]];
            dispatch_async(dispatch_get_main_queue(), ^{
                self.imageView.image = [[UIImage alloc] initWithData:imageData];
                [self setNeedsLayout];
            });
        });
        
        
        
        self.textLabel.text = weather.date;
        self.detailTextLabel.text = weather.temp;
        
    }
    return self;
}

@end
