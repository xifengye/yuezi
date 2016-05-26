//
//  Period.h
//  yuezi
//
//  Created by yexifeng on 16/5/26.
//  Copyright © 2016年 moregood. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum : NSUInteger {
    PeriodTypeBreakfast,
    PeriodTypeBreakfastAfter,
    PeriodTypeLunch,
    PeriodTypeLunchAfter,
    PeriodTypeSupper,
    PeriodTypeSupperAfter
} PeriodType;

@interface Period : NSObject
@property(nonatomic,copy)NSString* name;
@property(nonatomic,strong)NSArray* dishes;
@property(nonatomic,assign)PeriodType type;

-(instancetype)initWithPeriodIds:(NSArray*)array;

@end
