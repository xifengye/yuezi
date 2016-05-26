//
//  BreakfastAfter.m
//  yuezi
//
//  Created by yexifeng on 16/5/26.
//  Copyright © 2016年 moregood. All rights reserved.
//

#import "BreakfastAfter.h"

@implementation BreakfastAfter
-(instancetype)initWithPeriodIds:(NSArray *)arr{
    self  = [super initWithPeriodIds:arr];
    if(self) {
        self.name = @"早点";
        self.type = PeriodTypeBreakfastAfter;
    }
    return self;
}

@end
