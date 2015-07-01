//
//  XHWeatherViewController.m
//  Weather-UI-V1
//
//  Created by 00 on 15-6-23.
//  Copyright (c) 2015年 wxh. All rights reserved.
//

#import "XHWeatherViewController.h"
#import "XHLabelTool.h"
//#import "XHHeaderView.m"
#import "XHHeaderView.h"
#import "XHWeather.h"
#import "XHWeatherCell.h"

#include "XHHourlyWeatherViewController.h"
@interface XHWeatherViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) UIImageView *backgroundImageView;

@property (strong, nonatomic) XHHeaderView *headView;
@property (strong, nonatomic) NSArray *weathers;

@end

@implementation XHWeatherViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initTableView];
    
    [self initHeaderView];
    self.navigationController.navigationBarHidden = YES;
}


-(void)initHeaderView{
    CGRect headerFrame = [UIScreen mainScreen].bounds;
    self.headView = [[XHHeaderView alloc] initWithFrame:headerFrame];
    self.headView.backgroundColor = [UIColor clearColor];
    self.tableView.tableHeaderView = self.headView;
    [self sendRequest];
    
}


-(void)sendRequest{
    
    NSURL *url = [NSURL URLWithString:@"http://api.worldweatheronline.com/free/v2/weather.ashx?q=shenzhen&num_of_days=7&format=json&tp=2&key=cac094dd0a075634c07251b897ec6"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if([(NSHTTPURLResponse*)response statusCode]== 200){
            // NSLog(@"%@",[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding]);
            NSDictionary *jsonData = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            [self paraseJsonData:jsonData];
            
            
        }else{
            NSLog(@"%@",error.userInfo);
        }
    }];
    [task resume];
}


-(void)paraseJsonData:(NSDictionary *)jsonData{
    NSString *cityName = jsonData[@"data"][@"request"][0][@"query"];
    NSString *weatherDes = jsonData[@"data"][@"current_condition"][0][@"weatherDesc"][0][@"value"];
    NSString *temperature = jsonData[@"data"][@"current_condition"][0][@"temp_C"];
    NSString *urlStr = jsonData[@"data"][@"current_condition"][0][@"weatherIconUrl"][0][@"value"];
    NSURL *url = [NSURL URLWithString:urlStr];
    NSData *imageData = [NSData dataWithContentsOfURL:url];
    UIImage *image = [[UIImage alloc] initWithData:imageData];
    
    NSString *maxtemp = jsonData[@"data"][@"weather"][0][@"maxtempC"];
    NSString *mintemp = jsonData[@"data"][@"weather"][0][@"mintempC"];
    
    
    NSArray* weatherArray = jsonData[@"data"][@"weather"];
    NSMutableArray *weatherArrayCopy = [NSMutableArray new];
    for (NSDictionary *dict in weatherArray) {
        XHWeather *weather = [[XHWeather alloc] initWithDictionary:dict];
        
        [weatherArrayCopy addObject:weather];
    }
    
    self.weathers = [weatherArrayCopy copy];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        self.headView.cityLabel.text = cityName;
        self.headView.conditionLabel.text = weatherDes;
        self.headView.tempretureLabel.text = temperature;
        self.headView.iconView.image = image;
        self.headView.hiloLabel.text = [NSString stringWithFormat:@"%@/%@",mintemp,maxtemp];
        [self.tableView reloadData];
    });
    
}
-(void)initTableView{
    CGRect bounds = self.view.bounds;
    self.backgroundImageView = [[UIImageView alloc] initWithFrame:bounds];
    self.backgroundImageView.image = [UIImage imageNamed:@"bg.png"];
    
    
    self.tableView = [[UITableView alloc] initWithFrame:bounds];
    self.tableView.backgroundColor = [UIColor clearColor];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    
    self.tableView.separatorColor = [UIColor colorWithWhite:1 alpha:0.2];
    self.tableView.pagingEnabled = YES;
    
    
    [self.view addSubview:self.backgroundImageView];
    [self.view addSubview:self.tableView];
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.weathers.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    XHWeather* weather = self.weathers[indexPath.row];
    
    XHWeatherCell *cells = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cells) {
        cells = [[XHWeatherCell alloc] initWithWeather:weather];
    }
    
    cells.backgroundColor = [UIColor colorWithWhite:0 alpha:0.2];
    cells.textLabel.textColor = [UIColor whiteColor];
    
    cells.selectionStyle = UITableViewCellSelectionStyleNone;
    return cells;
    
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 200;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    XHWeather* weather = self.weathers[indexPath.row];
    XHHourlyWeatherController *hourlyVC = [[XHHourlyWeatherController alloc] init];
    hourlyVC.weatherArray = weather.hourlyArray;
    //    [self presentViewController:hourlyVC animated:YES completion:^{
    //
    //    }];
    hourlyVC.modalTransitionStyle = 3;
    [self presentViewController:hourlyVC animated:YES completion:nil];
    //[self.navigationController pushViewController:hourlyVC animated:YES];
}

@end
