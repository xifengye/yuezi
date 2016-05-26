//
//  SupperAfter.m
//  yuezi
//
//  Created by yexifeng on 16/5/26.
//  Copyright © 2016年 moregood. All rights reserved.
//

#import "SupperAfter.h"

@implementation SupperAfter
-(instancetype)initWithPeriodIds:(NSArray *)arr{
    self  = [super initWithPeriodIds:arr];
    if(self) {
        self.name = @"晚点";
        self.type = PeriodTypeSupperAfter;
    }
    return self;
}
@end
