//
//  OneDay.h
//  yuezi
//
//  Created by yexifeng on 16/5/26.
//  Copyright © 2016年 moregood. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Period.h"

typedef enum : NSUInteger {
    READY,
    COOKING,
    COMPLETE,
} CookStatus;

@interface OneDay : NSObject
@property(nonatomic,strong)NSArray* periods;
@property(nonatomic,assign)int dayIndex;

@end
