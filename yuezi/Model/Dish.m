//
//  Dish.m
//  yuezi
//
//  Created by yexifeng on 16/5/26.
//  Copyright © 2016年 moregood. All rights reserved.
//

#import "Dish.h"
#import "MJExtension.h"
#import "Manager.h"
#import "SkuMaterial.h"
#import "SM.h"

@implementation Dish
-(void)setMaterialList:(id)ml{
    NSMutableArray* ma = [NSMutableArray array];
    NSArray* arr;
    if([ml isKindOfClass:[NSDictionary class]]){
        arr = [NSArray arrayWithObject:[SM objectWithKeyValues:ml]];
    }else if([ml isKindOfClass:[NSArray class]]){
        arr = [SM objectArrayWithKeyValuesArray:ml];
    }
    for(SM* sm in arr){
        SkuMaterial* skum = [SkuMaterial alloc];
        skum.amount = sm.amount.floatValue;
        skum.material = [Manager instance].meterialDict[[NSNumber numberWithInt:sm.ID]];
        [ma addObject:skum];
    }
    _materialList = ma;
}
@end
