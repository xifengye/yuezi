//
//  LanuchAfter.m
//  yuezi
//
//  Created by yexifeng on 16/5/26.
//  Copyright © 2016年 moregood. All rights reserved.
//

#import "LunchAfter.h"

@implementation LunchAfter
-(instancetype)initWithPeriodIds:(NSArray *)arr{
    self  = [super initWithPeriodIds:arr];
    if(self) {
        self.name = @"午点";
        self.type = PeriodTypeLunchAfter;
    }
    return self;
}
@end
