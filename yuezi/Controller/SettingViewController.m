//
//  SettingViewController.m
//  yuezi
//
//  Created by yexifeng on 16/5/27.
//  Copyright © 2016年 moregood. All rights reserved.
//

#import "SettingViewController.h"

@interface SettingViewController ()

@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [_datePicker addTarget:self action:@selector(dateWillChange:) forControlEvents:UIControlEventValueChanged];
}

-(void)dateWillChange:(id)sender{
    NSDate* _date = _datePicker.date;
    NSUInteger unitFlags = NSDayCalendarUnit | NSMonthCalendarUnit | NSYearCalendarUnit;
    NSDateComponents * component = [_datePicker.calendar components:unitFlags fromDate:_date];
    
    NSUserDefaults *defaults =[NSUserDefaults standardUserDefaults];
    [defaults setInteger:[component month] forKey:@"_month"];
    [defaults setInteger:[component day] forKey:@"_day"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
