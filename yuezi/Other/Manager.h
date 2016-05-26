//
//  Manager.h
//  yuezi
//
//  Created by yexifeng on 16/5/26.
//  Copyright © 2016年 moregood. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OneDay.h"


@interface Manager : NSObject
@property(nonatomic,strong)NSMutableDictionary* meterialDict;
@property(nonatomic,strong)NSMutableDictionary* dishDict;

+(instancetype)instance;
-(OneDay*)getOneDay:(int)position;

@end
