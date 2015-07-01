//
//  XHHourlyWeatherController.m
//  Weather-UI-V1
//
//  Created by 00 on 15-6-23.
//  Copyright (c) 2015年 wxh. All rights reserved.
//
#import "XHHourlyWeatherViewController.h"
#import "XHWeatherCell.h"

@interface XHHourlyWeatherController ()<UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) UIImageView *backgroundImageView;
@property (strong, nonatomic) UIView *headView;
@end

@implementation XHHourlyWeatherController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initTableView];
    
    [self initHeaderView];
    self.navigationController.navigationBarHidden = NO;
}

-(void)initHeaderView{
    CGRect headerFrame = CGRectMake(0, 0, self.view.frame.size.width, 44);
    self.headView = [[UIView alloc] initWithFrame:headerFrame];
    self.headView.backgroundColor = [UIColor clearColor];
    self.tableView.tableHeaderView = self.headView;
    
    
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



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.weatherArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    XHWeather *weather = self.weatherArray[indexPath.row];
    XHWeatherCell *cell = [[XHWeatherCell alloc] initWithWeatherHourly:weather];
    
    cell.backgroundColor = [UIColor colorWithWhite:0 alpha:0.2];
    cell.textLabel.textColor = [UIColor whiteColor];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 150;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self dismissViewControllerAnimated:YES completion:NULL];
}

@end
