//
//  Supper.m
//  yuezi
//
//  Created by yexifeng on 16/5/26.
//  Copyright © 2016年 moregood. All rights reserved.
//

#import "Supper.h"

@implementation Supper
-(instancetype)initWithPeriodIds:(NSArray *)arr{
    self  = [super initWithPeriodIds:arr];
    if(self) {
        self.name = @"晚餐";
        self.type = PeriodTypeSupper;
    }
    return self;
}
@end
