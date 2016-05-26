//
//  Breakfast.m
//  yuezi
//
//  Created by yexifeng on 16/5/26.
//  Copyright © 2016年 moregood. All rights reserved.
//

#import "Breakfast.h"

@implementation Breakfast
-(instancetype)initWithPeriodIds:(NSArray *)arr{
    self  = [super initWithPeriodIds:arr];
    if(self) {
        self.name = @"早餐";
        self.type = PeriodTypeBreakfast;
    }
    return self;
}



@end
