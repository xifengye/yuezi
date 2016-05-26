//
//  Period.m
//  yuezi
//
//  Created by yexifeng on 16/5/26.
//  Copyright © 2016年 moregood. All rights reserved.
//

#import "Period.h"
#import "Manager.h"

@implementation Period
-(instancetype)initWithPeriodIds:(NSArray *)arr{
    self = [super init];
    if(self){
        NSMutableArray* array = [NSMutableArray array];
        for(NSNumber* i in arr){
            [array addObject:[Manager instance].dishDict[i]];
        }
        self.dishes = array;
    }
    return self;
}
@end
