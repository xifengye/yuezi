//
//  Launch.m
//  yuezi
//
//  Created by yexifeng on 16/5/26.
//  Copyright © 2016年 moregood. All rights reserved.
//

#import "Lunch.h"

@implementation Lunch
-(instancetype)initWithPeriodIds:(NSArray *)arr{
    self  = [super initWithPeriodIds:arr];
    if(self) {
        self.name = @"午餐";
        self.type = PeriodTypeLunch;
    }
    return self;
}
@end
